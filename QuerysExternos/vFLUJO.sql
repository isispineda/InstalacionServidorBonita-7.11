USE [BONITA_BPM]
GO

/****** Object:  View [dbo].[vFLUJO]    Script Date: 17/5/2021 11:34:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vFLUJO]
AS
SELECT        f.APELLIDOS_MOTORISTA, f.CODIGO_CASO, f.CONTENEDOR, f.CORREO_AVISO, f.ESTADO_FLUJO, f.FECHA_ADICION, f.FECHA_ENTRADA_LISTA, f.FECHA_FIN, f.FECHA_INICIO, f.FECHA_INICIO_SALIDA, f.FECHA_MODIFICACION, 
                         f.FECHA_NAC_MOTORISTA, f.FECHA_SALIDA_LISTA_DGA, f.FECHA_VENC_DOC_MOTORISTA, f.ID_ORIGEN_LECTURA, f.INICIO_SALIDA, f.MARCHAMO, f.NO_DOC_MOTORISTA, f.NOMBRES_MOTORISTA, f.OBSERVACION_FLUJO, 
                         f.PARABRISAS, f.PARQUEO, f.persistenceVersion, f.PESO, f.PLACA, f.SALIDA_LISTA_DGA, f.T_MAXIMO, f.T_MINIMO, f.TELEFONO_AVISO, f.TIPO_FINALIZACION, f.TIPO_FLUJO, f.TRASERA, f.USUARIO_ADICION, 
                         f.USUARIO_MODIFICACION, f.VACIO_SIN_DOCUMENTO, f.ID_FRONTERA_PID, f.ID_PC_INGRESO_PID, f.ID_PC_SALIDA_PID, f.ID_PROCESO_PID, f.ID_TIPO_MT_PID, f.PAIS_DOCUMENTO_PID, f.PLACA_PAIS_PID, f.TRASERA_PAIS_PID, 
                         CASE WHEN f.ESTADO_FLUJO = 'I' THEN 'INICIADO' WHEN f.ESTADO_FLUJO = 'F' THEN 'FINALIZADO' ELSE 'NO DETERMINADO' END AS FLUJO_ESTADO, b.NOMBRE_FRONTERA, m.NOMBRE_TIPO_MT,
                             (SELECT        NOMBRE_PC
                               FROM            dbo.PUNTOCONTROL AS p
                               WHERE        (f.ID_PC_INGRESO_PID = persistenceId)) AS PC_INGRESO_NOMBRE,
                             (SELECT        NOMBRE_PC
                               FROM            dbo.PUNTOCONTROL AS p
                               WHERE        (f.ID_PC_SALIDA_PID = persistenceId)) AS PC_SALIDA_NOMBRE,
                             (SELECT        NOMBRE_PROCESO
                               FROM            dbo.PROCESO AS P
                               WHERE        (persistenceId = f.ID_PROCESO_PID)) AS PROCESO, 
                         CASE WHEN f.TIPO_FINALIZACION = 'P' THEN 'PEDIENTE DE FINALIZAR' WHEN f.TIPO_FINALIZACION = 'E' THEN 'FINALIZADO' WHEN f.TIPO_FINALIZACION = 'R' THEN 'RETORNADO' WHEN f.TIPO_FINALIZACION = 'C' THEN 'CANCELADO'
                          ELSE 'NO DETERMINADO' END AS TIPO_FINALIZACION_DESC, CASE WHEN f.ESTADO_FLUJO = 'I' THEN 'INICIADO' WHEN f.ESTADO_FLUJO = 'F' THEN 'FINALIZADO' ELSE 'NO DETERMINADO' END AS ESTADO_FLUJO_DESC, 
                         DATEPART(yy, f.FECHA_INICIO) AS FECHA_INICIO_ANIO, DATEPART(MM, f.FECHA_INICIO) AS FECHA_INICIO_MES_N, CASE WHEN datepart(MM, f.FECHA_INICIO) = 1 THEN '01 - ENERO' WHEN datepart(MM, f.FECHA_INICIO) 
                         = 2 THEN '02 - FEBRERO' WHEN datepart(MM, f.FECHA_INICIO) = 3 THEN '03 - MARZO' WHEN datepart(MM, f.FECHA_INICIO) = 4 THEN '04 - ABRIL' WHEN datepart(MM, f.FECHA_INICIO) 
                         = 5 THEN '05 - MAYO' WHEN datepart(MM, f.FECHA_INICIO) = 6 THEN '06 - JUNIO' WHEN datepart(MM, f.FECHA_INICIO) = 7 THEN '07 - JULIO' WHEN datepart(MM, f.FECHA_INICIO) = 8 THEN '08 - AGOSTO' WHEN datepart(MM, 
                         f.FECHA_INICIO) = 9 THEN '09 - SEPTIEMBRE' WHEN datepart(MM, f.FECHA_INICIO) = 10 THEN '10 - OCTUBRE' WHEN datepart(MM, f.FECHA_INICIO) = 11 THEN '11 - NOVIEMBRE' WHEN datepart(MM, f.FECHA_INICIO) 
                         = 12 THEN '12 - DICIEMBRE' END AS FECHA_INICIO_MES, RIGHT('00' + CAST(DATEPART(dd, f.FECHA_INICIO) AS VARCHAR(2)), 2) AS FECHA_INICIO_DIA, RIGHT('00' + CAST(DATEPART(HH, f.FECHA_INICIO) AS VARCHAR(2)), 2) 
                         AS FECHA_INICIO_HORA, DATEPART(yy, f.FECHA_FIN) AS FECHA_FIN_ANIO, DATEPART(MM, f.FECHA_FIN) AS FECHA_FIN_MES_N, CASE WHEN datepart(MM, f.FECHA_FIN) = 1 THEN '01 - ENERO' WHEN datepart(MM, 
                         f.FECHA_FIN) = 2 THEN '02 - FEBRERO' WHEN datepart(MM, f.FECHA_FIN) = 3 THEN '03 - MARZO' WHEN datepart(MM, f.FECHA_FIN) = 4 THEN '04 - ABRIL' WHEN datepart(MM, f.FECHA_FIN) 
                         = 5 THEN '05 - MAYO' WHEN datepart(MM, f.FECHA_FIN) = 6 THEN '06 - JUNIO' WHEN datepart(MM, f.FECHA_FIN) = 7 THEN '07 - JULIO' WHEN datepart(MM, f.FECHA_FIN) = 8 THEN '08 - AGOSTO' WHEN datepart(MM, 
                         f.FECHA_FIN) = 9 THEN '09 - SEPTIEMBRE' WHEN datepart(MM, f.FECHA_FIN) = 10 THEN '10 - OCTUBRE' WHEN datepart(MM, f.FECHA_FIN) = 11 THEN '11 - NOVIEMBRE' WHEN datepart(MM, f.FECHA_FIN) 
                         = 12 THEN '12 - DICIEMBRE' END AS FECHA_FIN_MES, RIGHT('00' + CAST(DATEPART(dd, f.FECHA_FIN) AS VARCHAR(2)), 2) AS FECHA_FIN_DIA, RIGHT('00' + CAST(DATEPART(HH, f.FECHA_FIN) AS VARCHAR(2)), 2) 
                         AS FECHA_FIN_HORA, CASE WHEN f.FECHA_FIN IS NULL THEN datediff(mi, f.FECHA_INICIO, getdate()) WHEN f.FECHA_FIN IS NOT NULL THEN datediff(mi, f.FECHA_INICIO, f.FECHA_FIN) END AS DURACION
FROM            dbo.FLUJO AS f LEFT OUTER JOIN
                         dbo.FRONTERA AS b ON b.persistenceId = f.ID_FRONTERA_PID LEFT OUTER JOIN
                         dbo.TIPOMEDIOTRANSPORTE AS m ON m.persistenceId = f.ID_TIPO_MT_PID
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "f"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 299
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vFLUJO'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vFLUJO'
GO


