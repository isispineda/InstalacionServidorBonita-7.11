USE [bonita_bpm]
GO

/****** Object:  Table [dbo].[RESTACCIONACTIVIDAD]    Script Date: 8/6/2021 12:19:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTACCIONACTIVIDAD]') AND type in (N'U'))
DROP TABLE [dbo].[RESTACCIONACTIVIDAD]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTMAG]') AND type in (N'U'))
DROP TABLE [dbo].RESTMAG
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTDGME]') AND type in (N'U'))
DROP TABLE [dbo].RESTDGME
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTOUTPUTSE]') AND type in (N'U'))
DROP TABLE [dbo].RESTOUTPUTSE
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTPERMISTLIST]') AND type in (N'U'))
DROP TABLE [dbo].RESTPERMISTLIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTRANSPORTMEDIAINFO]') AND type in (N'U'))
DROP TABLE [dbo].RESTRANSPORTMEDIAINFO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PLAZOS]') AND type in (N'U'))
DROP TABLE [dbo].PLAZOS
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTPROCESSEDDUCALIST]') AND type in (N'U'))
DROP TABLE [dbo].RESTPROCESSEDDUCALIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTCONTEINERSLIST]') AND type in (N'U'))
DROP TABLE [dbo].RESTCONTEINERSLIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTDgaDato_marchamos_sls_ide]') AND type in (N'U'))
DROP TABLE [dbo].RESTDgaDato_marchamos_sls_ide
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTDgaDato_contenedor_ctn_ide]') AND type in (N'U'))
DROP TABLE [dbo].RESTDgaDato_contenedor_ctn_ide
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTDGADATO_ADUANASPASO_TR]') AND type in (N'U'))
DROP TABLE [dbo].RESTDGADATO_ADUANASPASO_TR
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTDGADATO]') AND type in (N'U'))
DROP TABLE [dbo].RESTDGADATO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTSALIDALISTA]') AND type in (N'U'))
DROP TABLE [dbo].RESTSALIDALISTA
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTSCGOUTPUT]') AND type in (N'U'))
DROP TABLE [dbo].RESTSCGOUTPUT
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BITACORAEXTERNA]') AND type in (N'U'))
DROP TABLE [dbo].BITACORAEXTERNA
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INCIDENTE]') AND type in (N'U'))
DROP TABLE [dbo].INCIDENTE
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LECTURAPUNTO]') AND type in (N'U'))
DROP TABLE [dbo].LECTURAPUNTO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESTDUCAOUPUTLIST]') AND type in (N'U'))
DROP TABLE [dbo].RESTDUCAOUPUTLIST
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ALERTA]') AND type in (N'U'))
DROP TABLE [dbo].ALERTA
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MENSAJE]') AND type in (N'U'))
DROP TABLE [dbo].MENSAJE
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACCION]') AND type in (N'U'))
DROP TABLE [dbo].ACCION
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FLUJO]') AND type in (N'U'))
DROP TABLE [dbo].FLUJO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AREA]') AND type in (N'U'))
DROP TABLE [dbo].AREA
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FRONTERA]') AND type in (N'U'))
DROP TABLE [dbo].FRONTERA
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INSTITUCION]') AND type in (N'U'))
DROP TABLE [dbo].INSTITUCION
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROCESO]') AND type in (N'U'))
DROP TABLE [dbo].PROCESO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PUNTOCONTROL]') AND type in (N'U'))
DROP TABLE [dbo].PUNTOCONTROL
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPODOCDGA]') AND type in (N'U'))
DROP TABLE [dbo].TIPODOCDGA
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPODOCVIAJE]') AND type in (N'U'))
DROP TABLE [dbo].TIPODOCVIAJE
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPOINCIDENTE]') AND type in (N'U'))
DROP TABLE [dbo].TIPOINCIDENTE
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPOMEDIOTRANSPORTE]') AND type in (N'U'))
DROP TABLE [dbo].TIPOMEDIOTRANSPORTE
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAIS]') AND type in (N'U'))
DROP TABLE [dbo].PAIS

GO


