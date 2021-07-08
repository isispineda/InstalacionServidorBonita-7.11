USE [BONITA_BPM]
GO

/****** Object:  View [dbo].[vcoex01]    Script Date: 17/5/2021 11:33:57 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

create view [dbo].[vcoex01]

AS



SELECT 

    f.[persistenceId],
    f.APELLIDOS_MOTORISTA,
	f.CODIGO_CASO,
	f.CONTENEDOR,
	f.CORREO_AVISO,
    case 
	   when f.ESTADO_FLUJO = 'I' then 'INICIADO' 
	   when f.ESTADO_FLUJO = 'F' then 'FINALIZADO'
	   else 'NO DETERMINADO'
	END AS FLUJO_ESTADO,
	f.FECHA_ADICION,
	f.FECHA_ENTRADA_LISTA,
	convert(datetime,f.FECHA_FIN) as  FECHA_FIN,
	convert(datetime,f.FECHA_INICIO) as FECHA_INICIO,
	f.FECHA_INICIO_SALIDA,
	f.FECHA_MODIFICACION,
	f.FECHA_NAC_MOTORISTA,
	f.FECHA_SALIDA_LISTA_DGA,
	f.FECHA_VENC_DOC_MOTORISTA,
	f.ID_ORIGEN_LECTURA,
	f.INICIO_SALIDA,
	f.MARCHAMO,
	f.NO_DOC_MOTORISTA,
	f.NOMBRES_MOTORISTA,
	f.OBSERVACION_FLUJO,
	f.PARABRISAS,
	f.PARQUEO,
	f.persistenceVersion,
	f.PESO,
	f.PLACA,
    case when f.[SALIDA_LISTA_DGA] = 'S' then 'SI'
	      when f.[SALIDA_LISTA_DGA] = 'N' then 'NO'
    end as SALIDA_LISTA,
	f.T_MAXIMO,
	f.T_MINIMO,
	f.TELEFONO_AVISO,
	f.TIPO_DOCUMENTO_PID,
	f.TIPO_FINALIZACION,
	f.TIPO_FLUJO,
	f.TRASERA,
	f.USUARIO_ADICION,
	f.USUARIO_MODIFICACION,
	f.VACIO_SIN_DOCUMENTO,
	f.ID_FRONTERA_PID,
	f.ID_PC_INGRESO_PID,
	f.ID_PC_SALIDA_PID,
	f.ID_PROCESO_PID,
	f.ID_TIPO_MT_PID,
	f.PAIS_DOCUMENTO_PID,
	f.PLACA_PAIS_PID,
	f.TRASERA_PAIS_PID,
	PC_SALIDA_NOMBRE = (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_SALIDA_PID = p.persistenceId ),
    PC_INGRESO_NOMBRE = (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_INGRESO_PID = p.persistenceId ),
    
    

	case
	when f.ID_PROCESO_PID = 2   then 'IMPORTACIONES'
	when f.ID_PROCESO_PID = 3   then 'EXPORTACIONES'
	when f.ID_PROCESO_PID = 4 and (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_INGRESO_PID = p.persistenceId ) = 'E002' then 'TRANSITOS HACIA ES'
	when f.ID_PROCESO_PID = 4 and (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_INGRESO_PID = p.persistenceId ) = 'E001' then 'TRANSITOS HACIA GT'
	when (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_INGRESO_PID = p.persistenceId ) = 'E001' and f.ESTADO_FLUJO = 'F' AND f.TIPO_FINALIZACION = 'R'then 'RETORNOS HACIA ES'
	when (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_INGRESO_PID = p.persistenceId ) = 'E002' and f.ESTADO_FLUJO = 'F' AND f.TIPO_FINALIZACION = 'R' then 'RETORNOS HACIA GT'
	when (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_INGRESO_PID = p.persistenceId ) = 'E002' and  f.VACIO_SIN_DOCUMENTO = 1 AND f.ESTADO_FLUJO = 'F' AND f.TIPO_FINALIZACION = 'E' then 'VACIOS HACIA ES'
	when (select NOMBRE_PC from PUNTOCONTROL p where f.ID_PC_INGRESO_PID = p.persistenceId ) = 'E001' and  f.VACIO_SIN_DOCUMENTO= 1 AND f.ESTADO_FLUJO = 'F' AND f.TIPO_FINALIZACION = 'E' then 'VACIOS HACIA GT'
	else 'NO DETERMINADO'
	END AS PROCESO,
    

	CASE 
	when f.TIPO_FINALIZACION = 'P' THEN 'EN PROCESO'
	when f.TIPO_FINALIZACION = 'E' THEN 'FINALIZADO'
	when f.TIPO_FINALIZACION = 'R' THEN 'RETORNADO'
	when f.TIPO_FINALIZACION = 'C' THEN 'CANCELADO'
	else 'NO DETERMINADO'
	END AS TIPO_FINALIZACION_DESC ,	   
    
	case
	when f.ESTADO_FLUJO = 'I' then 'INICIADO'
    when f.ESTADO_FLUJO = 'F' then 'FINALIZADO'
	else 'NO DETERMINADO'
	END AS ESTADO_FLUJO_DESC ,  



	CASE 
	when f.FECHA_FIN IS NULL then datediff(mi,  f.FECHA_INICIO, getdate()) 
	when f.FECHA_FIN IS not NULL then datediff(mi,  f.FECHA_INICIO, f.FECHA_FIN) 
	end as DURACION 
    
 
    
FROM  dbo.FLUJO  f
full join dbo.ACCION a on a.CODIGO_CASO = f.CODIGO_CASO
left join dbo.AREA r on r.CODIGO_AREA = a.ID_AREA_PID
left join dbo.INSTITUCION i on a.ID_INSTITUCION_PID = i.CODIGO_INSTITUCION
left join dbo.FRONTERA b  on b.persistenceId = f.ID_FRONTERA_PID
left join dbo.TIPOMEDIOTRANSPORTE m on m.persistenceId = f.ID_TIPO_MT_PID
left join dbo.PROCESO p on m.persistenceId = f.ID_PROCESO_PID

GO


