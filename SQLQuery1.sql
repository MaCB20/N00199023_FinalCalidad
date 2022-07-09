USE [Final_Calidad]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 9/07/2022 01:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 9/07/2022 01:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[SaldoInicial] [decimal](18, 2) NOT NULL,
	[Moneda] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 9/07/2022 01:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 9/07/2022 01:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Transaccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cuenta] ON 
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (7, N'Cuenta Efectivo', N'Propio', N'Efectivo', CAST(2440.00 AS Decimal(18, 2)), N'Soles')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (8, N'Cuenta de Ahorros BCP', N'Propio', N'Efectivo', CAST(100.00 AS Decimal(18, 2)), N'Dolares')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (9, N'Cuenta de Gastos BCP', N'Propio', N'Efectivo', CAST(150.00 AS Decimal(18, 2)), N'Soles')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (10, N'Cuenta de Gastos BCP', N'Propio', N'Efectivo', CAST(550.00 AS Decimal(18, 2)), N'Soles')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (11, N'Cuenta de Ahorros Casa', N'Propio', N'Efectivo', CAST(5000.00 AS Decimal(18, 2)), N'Soles')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (12, N'Cuenta de Ahorros Casa', N'Propio', N'Efectivo', CAST(5000.00 AS Decimal(18, 2)), N'Soles')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (14, N'Cuenta ABC', N'Propio', N'Efectivo', CAST(0.00 AS Decimal(18, 2)), N'Soles')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (20, N'Cuenta de Ahorros Casa', N'Propio', N'Efectivo', CAST(5000.00 AS Decimal(18, 2)), N'Soles')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (21, N'Cuenta Credito', N'Credito', N'Tarjeta de Credito', CAST(2500.00 AS Decimal(18, 2)), N'Dolares')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (22, N'Entra y Sale', N'Propio', N'Efectivo', CAST(3250.00 AS Decimal(18, 2)), N'Dolares')
GO
INSERT [dbo].[Cuenta] ([Id], [Nombre], [Categoria], [Tipo], [SaldoInicial], [Moneda]) VALUES (23, N'Cuenta UPN', N'Propio', N'Efectivo', CAST(2500.00 AS Decimal(18, 2)), N'Soles')
GO
SET IDENTITY_INSERT [dbo].[Cuenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo] ON 
GO
INSERT [dbo].[Tipo] ([Id], [Descripcion], [IdCategoria]) VALUES (1, N'Efectivo', 1)
GO
INSERT [dbo].[Tipo] ([Id], [Descripcion], [IdCategoria]) VALUES (2, N'Tarjeta de Debito', 1)
GO
INSERT [dbo].[Tipo] ([Id], [Descripcion], [IdCategoria]) VALUES (3, N'Tarjeta de Credito', 2)
GO
INSERT [dbo].[Tipo] ([Id], [Descripcion], [IdCategoria]) VALUES (4, N'Prestamo', 2)
GO
SET IDENTITY_INSERT [dbo].[Tipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaccion] ON 
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (1, 0, CAST(N'2022-07-08T22:35:33.583' AS DateTime), N'Zapatillas', CAST(500.00 AS Decimal(18, 2)), N'Ingreso')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (2, 7, CAST(N'2022-07-08T23:07:43.703' AS DateTime), N'Zapatillas', CAST(100.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (3, 7, CAST(N'2022-07-08T23:08:05.863' AS DateTime), N'Caja de Colores', CAST(200.00 AS Decimal(18, 2)), N'Ingreso')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (4, 8, CAST(N'2022-07-08T23:08:26.380' AS DateTime), N'Comida de Mascota', CAST(300.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (5, 8, CAST(N'2022-07-08T23:08:46.923' AS DateTime), N'Trabajo', CAST(100.00 AS Decimal(18, 2)), N'Ingreso')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (6, 7, CAST(N'2022-07-08T23:46:19.010' AS DateTime), N'Zapatillas', CAST(100.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (7, 8, CAST(N'2022-07-08T23:48:19.173' AS DateTime), N'Comida', CAST(100.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (8, 8, CAST(N'2022-07-08T23:58:24.313' AS DateTime), N'Articulos Varios', CAST(200.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (9, 7, CAST(N'2022-07-09T00:09:47.043' AS DateTime), N'Caja de Colores', CAST(100.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (10, 7, CAST(N'2022-07-09T01:05:21.150' AS DateTime), N'Zapatillas', CAST(100.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (11, 7, CAST(N'2022-07-09T01:06:04.183' AS DateTime), N'Gallinas', CAST(50.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (12, 7, CAST(N'2022-07-09T01:11:38.433' AS DateTime), N'Cuyes', CAST(70.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (13, 7, CAST(N'2022-07-09T01:12:19.113' AS DateTime), N'Cuyes', CAST(70.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (14, 7, CAST(N'2022-07-09T01:12:42.000' AS DateTime), N'Cuyes', CAST(70.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (15, 7, CAST(N'2022-07-09T01:13:45.493' AS DateTime), N'Loteria', CAST(1200.00 AS Decimal(18, 2)), N'Ingreso')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (16, 7, CAST(N'2022-07-09T01:14:17.513' AS DateTime), N'Loteria', CAST(1200.00 AS Decimal(18, 2)), N'Ingreso')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (17, 8, CAST(N'2022-07-09T01:36:38.820' AS DateTime), N'Zapatillas', CAST(400.00 AS Decimal(18, 2)), N'Gasto')
GO
INSERT [dbo].[Transaccion] ([Id], [IdCuenta], [Fecha], [Descripcion], [Monto], [Tipo]) VALUES (18, 9, CAST(N'2022-07-09T01:36:57.137' AS DateTime), N'asd', CAST(400.00 AS Decimal(18, 2)), N'Gasto')
GO
SET IDENTITY_INSERT [dbo].[Transaccion] OFF
GO
