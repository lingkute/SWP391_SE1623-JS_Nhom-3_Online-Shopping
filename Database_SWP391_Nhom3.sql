USE [master]
GO

CREATE DATABASE [SWDHutech]
GO
ALTER DATABASE [SWDHutech] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWDHutech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWDHutech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWDHutech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWDHutech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWDHutech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWDHutech] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWDHutech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWDHutech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWDHutech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWDHutech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWDHutech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWDHutech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWDHutech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWDHutech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWDHutech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWDHutech] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWDHutech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWDHutech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWDHutech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWDHutech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWDHutech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWDHutech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWDHutech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWDHutech] SET RECOVERY FULL 
GO
ALTER DATABASE [SWDHutech] SET  MULTI_USER 
GO
ALTER DATABASE [SWDHutech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWDHutech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWDHutech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWDHutech] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWDHutech] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWDHutech] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWDHutech', N'ON'
GO
ALTER DATABASE [SWDHutech] SET QUERY_STORE = OFF
GO
USE [SWDHutech]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[dateCreate] [datetime] NULL,
	[total] [money] NULL,
	[recName] [nvarchar](30) NULL,
	[recAddress] [nvarchar](200) NULL,
	[recPhone] [varchar](20) NULL,
	[status] [int] NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[bid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK__BillDeta__6343D076BE0035B6] PRIMARY KEY CLUSTERED 
(
	[bid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[pQuantity] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cateId] [varchar](30) NOT NULL,
	[cateName] [nvarchar](100) NOT NULL,
	[image] [varchar](200) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import History]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import History](
	[importid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[provider_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Import History] PRIMARY KEY CLUSTERED 
(
	[importid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[post_title] [nvarchar](200) NOT NULL,
	[post_des] [nvarchar](500) NOT NULL,
	[post_flag] [bit] NOT NULL,
	[created_by] [int] NOT NULL,
	[thumbnail] [varchar](900) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[postid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [int] NOT NULL,
	[pname] [nvarchar](200) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[image] [varchar](200) NULL,
	[description] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[cateId] [varchar](30) NULL,
	[provider_id] [int] NULL,
 CONSTRAINT [PK__Product__DD37D91A1B5749EB] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[provider_id] [int] IDENTITY(1,1) NOT NULL,
	[provider_name] [nvarchar](200) NOT NULL,
	[provider_email] [nvarchar](150) NULL,
	[provider_address] [nvarchar](200) NOT NULL,
	[provider_status] [nchar](10) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[provider_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[reviewid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[pid] [nvarchar](10) NOT NULL,
	[user_comment] [nvarchar](max) NULL,
	[user_rating] [int] NULL,
	[user_timecomment] [datetime] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[reviewid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/22/2022 12:51:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[roleid] [int] NULL,
	[fullName] [nvarchar](30) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](20) NULL,
	[email] [nvarchar](200) NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](32) NULL,
	[status] [bit] NULL,
	[gender] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'hieu', N'123')
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'huy', N'daddy146')
GO
INSERT [dbo].[Cart] ([CartId], [cid], [pid], [pQuantity]) VALUES (1, 6, 1, 1)
INSERT [dbo].[Cart] ([CartId], [cid], [pid], [pQuantity]) VALUES (2, 6, 3, 5)
GO
INSERT [dbo].[Category] ([cateId], [cateName], [image], [status]) VALUES (N'1', N'Laptop', N'https://toplap.vn/storage/img/SBW8yUsMFd63u7bekPmCXDJuEAoJ3wFGxM2mDq9g.jpeg', 1)
INSERT [dbo].[Category] ([cateId], [cateName], [image], [status]) VALUES (N'2', N'PC Case', N'https://product.hstatic.net/1000026716/product/dw_creator_gamma_249e52aade474ff8a6487035b23817d9_large.jpg', 1)
INSERT [dbo].[Category] ([cateId], [cateName], [image], [status]) VALUES (N'3', N'Top Trending', NULL, 0)
GO
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (1, N'Laptop gaming Gigabyte G5 GD 51VN123SO', 50, 1500.0000, N'https://product.hstatic.net/1000026716/product/giga_9bd402130a6646b0a0865c8a14956557.png', N'1x USB2.0 Type-A
1x USB3.2 Gen1 Type-A
1x USB3.2 Gen2 Type-A
1x USB 3.2 Gen 2 Type-C
1x mini DP 1.4
1x HDMI 2.0 
1x Audio combo jack
1x Microphone jack
1x SD Card Reader', 1, N'1', 1)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (2, N'Laptop gaming Acer Aspire 7 A715 43G R8GA', 30, 1200.0000, N'https://product.hstatic.net/1000026716/product/r8ga_15109189103c4dd7b706dfd168dbed04.png', N'1 x USB Type-C™ port: USB 3.2 Gen 1 (up to 5 Gbps)
2 x USB 3.2 Gen 1 ports with one featuring power-off USB charging
1x USB 2.0 port
1 x 3.5 mm headphone/speaker jack, supporting headsets with built-in
1x HDMI® port with HDCP support
1x Ethernet (RJ-45) port
1x DC-in jack for AC adapter
FingerPrint', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (3, N'Laptop gaming ASUS ROG Strix G G531GT HN553T', 40, 1400.0000, N'https://product.hstatic.net/1000026716/product/gearvn.com-laptop-gaming-asus-rog-g531gt-1_97e395a45c824abeb1869f837d5c78fe.jpg', N'Asus ROG STRIX G G731GT-AU004T H7114T embodies minimalistic design that delivers the most intense core gaming experience possible.
<br> 
This laptop brings great power to fight heavyweight games and multitasking with Windows 10, along with an advanced cooling system with many unexpected advantages. ', 0, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (4, N'Laptop Lenovo IdeaPad Gaming 3 15IMH05 81Y4006SVN', 50, 1100.0000, N'https://product.hstatic.net/1000026716/product/6svn_c07de64485554bf7b0a13ec7813eaf84.png', N'Lenovo Ideapad laptops are mid-range gaming laptops and targeted at office workers.
<br> 
When you want a computer that looks the most normal but when needed, still able to entertain and play games, Ideapad Gaming 3 15IMH05 81Y4006SVN will be the first choice. 
<br>
Possessing a minimalistic design, the look is not too aggressive, but still possesses high performance.', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (5, N'Laptop gaming Acer Nitro 5 AN515 55 5923', 25, 1250.0000, N'https://product.hstatic.net/1000026716/product/laptop-gaming-acer-nitro-5-an515-55-5923_8363b2366bfa40c6a60111ebc690bafe.jpg', N'The new generation Acer Nitro 5 retains the two distinctive red-black colors of Acer mid-range gaming laptops. 
<br>
But with the latest version, the edges of the machine are squeezed more angular to bring a sturdy look but not lose the subtle beauty of the machine. 
<br>
Keep the same plus on previous generations with the black-coated lid and prominent ACER logo in the middle.', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (6, N'Laptop gaming Lenovo Legion 5 Pro 16IAH7H 82RF0045VN', 20, 1150.0000, N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-lenovo-legion-5-pro-16iah7h-82rf0045vn-1_8887c5d9d4a3407aaac55f5a6bb31a52.png', N'If you are a gamer who is passionate about heavy games and likes to play games anytime, anywhere.
<br>
Then, you must definitely need a powerful, compact Gaming Laptop that is easy to move.
<br>
With Lenovo Legion 5 15IMH05 for you here "Strong configuration - Cool heat dissipation - Compact".', 0, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (7, N'GVN PHANTOM i3060Ti', 2, 950.0000, N'https://product.hstatic.net/1000026716/product/1_c294a5c925b94de485d8f05c37bdd288.jpg', N'Asus TUF GT301 (3 fan RGB) là chiếc case được lựa chọn dành cho GVN PHANTOM i3060Ti. Sở hữu kích thước đủ lớn dành cho 7 chiếc fan 120mm hay tản nhiệt AIO 360mm, Asus TUF GT301 (3 fan RGB) cho bạn thoải mái trang bị hệ thống tản nhiệt dành cho dàn PC của mình. ', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (8, N'GVN VIPER i1650', 3, 350.0000, N'https://product.hstatic.net/1000026716/product/viper_i1650_d293ff0cc50b4354ad9f932aa28c7d61.jpg', N'Through very thorough testing and evaluation, GEARVN launched PC GVN Ventus M for professional gamers.
<br>
With the powerful performance coming from VGA, you can fight almost all the most popular titles from online (PUBG, Apex, COD: Warzone, ...) to offline games that require huge hardware ( for example: Rise of the Tomb Raider, Red Dead Redemption 2, ...) at the setting from Medium - High, lag or drog FPS almost does not appear if the setting is appropriate.', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (9, N'GVN PHANTOM Plus i3070 WHITE', 4, 550.0000, N'https://product.hstatic.net/1000026716/product/1_52d487527a31419684bd65da19b7000b.jpg', N'The case used in the GVN Viper system is Golden Field N17Plus with 2 tempered glass sides, adding beauty to the internal components and ensuring safety from physical agents for the whole system. .', 0, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (10, N'GVN MINION i3050', 4, 650.0000, N'https://product.hstatic.net/1000026716/product/minion_i3050_ee668789d6ae451481ed707e47040e03.jpg', N'<p><strong><a >Đánh giá chi tiết GVN Minion i3050
Đầu tư vào một bộ PC đúng cách luôn là vấn đề nan giải đối với dân công nghệ nói chung và game thủ nói riêng. Bởi vì nếu không tìm hiểu hoặc được tư vấn kỹ lưỡng, các bạn sẽ rất dễ bỏ tiền ra mua những linh kiện không thật sự phù hợp với nhu cầu sử dụng, hoặc thậm chí máy tính không hoạt động tốt như mong muốn so với số tiền bỏ ra.



 

Hiểu được điều đó, GEARVN chúng tôi đã tạo ra sẵn rất nhiều bộ PC khác nhau dành cho từng phân khúc người dùng với từng mức tiền khác nhau để bạn có thể thoải mái và dễ dàng lựa chọn một bộ PC phù hợp với mình mà không sợ lựa chọn sai hoặc đầu tư phí tiền. Bộ PC gaming lần này mà GEARVN muốn giới thiệu tới các bạn có tên là GVN Minion M, nhằm hướng tới phân khúc người dùng phổ thông nhưng vẫn đảm bảo hiệu năng tốt.

Hiệu năng vượt trội
GVN Minion i3050 sở hữu hiệu suất cao với CPU đến từ đội xanh với chíp xử lý Intel Core i3 12100F (4 nhân/8 luồng). Với ưu thế vượt trội về số nhân lẫn số luồng cùng khả năng ép xung mạnh mẽ, bạn hoàn toàn có thể tin tưởng vào khả năng xử lý đa tác vụ lẫn chơi các tựa game đòi hỏi tài nguyên CPU lớn mà không sợ gặp tình trạng vi xử lý hoạt động quá mức.

Với mức hiệu năng này, ngoài chuyện kết hợp hoàn hảo cùng VGA để chơi game ra, bạn sẽ còn có thể xử lý nhiều tác vụ khác nữa.



GVN Minion M được trang bị VGA đến từ nhà sản xuất card đồ họa nổi tiến NVIDIA. RTX 3050 thừa sức đủ để chơi hầu hết các tựa game AAA ở mức FPS là 60.



Nếu nhu cầu của đa số người tiêu dùng chỉ dừng lại ở việc muốn chơi tốt, mượt mà không cần suy nghĩ các tựa game Online như Liên Minh Huyền Thoại, Dota2, PUBG, CS:GO hay kể cả tựa game FPS mới nhất như Valorant thì RTX 3050 có thể thỏa sức thể hiện sức mạnh của mình để mang tới cho bạn một trải nghiệm chơi game tốt nhất có thể.

Dễ dàng nâng cấp về sau
Bo mạch chủ mà GVN Minion i3050 đang sử dụng là ASUS PRIME H610M-A WIFI D4 với 2 khe RAM, tức là về sau nếu có nhu cầu, bạn có thể mua thêm 1 thanh RAM 8GB nữa để đủ 16GB RAM tiêu chuẩn cho hầu hết các tựa game hiện nay. Case PC cũng rất rộng rãi, bạn hoàn toàn có thể mua thêm nhiều ổ SSD, HDD, quạt hay thậm chí là các tản nhiệt cho CPU mà không sợ thiếu chỗ.



Kingston Fury Beast 8GB 3200 DDR4 RGB (KF432C16BBA/8)
Ngoài ra, GVN Minion i3050 cũng sẽ được trang bị 8GB RAM đủ để bạn có thể chơi game Online thoải mái, và ổ cứng SSD 240GB đảm bảo tốc độ khởi động máy, tắt máy hay các thao tác mở game, ứng dụng nhanh hơn rất nhiều so với các ổ HDD thông thường.



 

RAM Kingston Fury Beast 8GB 3200 DDR4 RGB (KF432C16BBA/8) đang sử dụng đèn LED RGB đầy đủ màu sắc rực rỡ chiếu sáng với hiệu ứng dòng chảy lực dễ dàng đồng bộ với các thiết bị ngoại vi như bàn phím, chuột và các phụ kiện khác. Các vùng đèn sáng trên RAM có thể phát sáng với góc siêu rộng lên đến 120 độ tạo nên trải nghiệm thị giác tuyệt vời, tô điểm thêm cho bữa tiệc ánh sáng trong chiếc case máy tính của bạn.

Vì để tối ưu trong việc giữ giá tiền thấp nhất có thể trong khi hiệu năng vẫn đảm bảo cho nên GVN Minion sẽ không có sẵn ổ cứng HDD, tuy nhiên bạn hoàn toàn có thể mua thêm nếu nhu cầu của bạn cần lưu trữ nhiều.

PNY CS900 240G 2.5" Sata 3
Với chất lượng vượt trội và hiệu năng cao. SSD PNY là một sự lựa chọn tối ưu khi bạn muốn nâng cấp ổ cứng. Rất nhanh với tốc độ đọc ghi tuần tự có thể lên đến 535Mb/s và 500Mb/s. Giờ đây mọi thao tác trên máy tính của bạn diễn ra một cách nhanh chóng và mượt mà nhất có thể. Tăng hiệu năng toàn bộ của máy tính lên rất nhiều.

Tốc độ truy xuất nhanh hơn 20 lần so với ổ cứng thông thường. SSD PNY hoạt động ở giao diện SATA III với tốc độ đọc và ghi tuần tự lên đến 535Mb/s và 500 Mb/s, làm cho nó trở thành người bạn đồng hành hoàn hảo cho những game thủ muốn nâng cấp ổ cứng mới của mình.

Nguồn SilverStone ST65F-ES230 - 80 Plus
Nguồn SilverStone ST65F-ES230 - 80 Plus mang lại hiệu quả cao với chứng nhận 80 PLUS. Nguồn giúp giảm nhiệt lãng phí và tiết kiệm điện nhờ được thiết kế cho mức hiệu quả 80 PLUS. 



Được trang bị quạt tích hợp 120mm mang đến luồng không khí tuyệt vời và có độ ồn thấp phù hợp cho các nhu cầu sử dụng đối với nhu cầu đáp ứng tốt cho công việc và nhu cầu build bộ PC học tập và làm việc. Ngoài ra, nguồn có hỗ trợ đầu nối PCIe 8pin và PCIe 6pin. Nguồn có thiết kế đường ray đơn + 12V mạnh mẽ, người dùng có thể dễ dàng nâng cấp hoặc ép xung linh kiện cao cấp khi có cần thiết.

Case Deepcool MATREXX 40 3FS (3 fan RGB)
Tuy là case khá nhỏ gọn nhưng được hỗ trợ khả năng làm mát cực kỳ ấn tượng với ba quạt LED đi cùng. Cùng với đó case được trang bị một tấm kính cường lực mặt bên để tăng thêm tính thẩm mỹ của vỏ case. 



Ba quạt 120mm được cài đặt sẵn trong Case Deepcool MATREXX 40 3FS (3 fan RGB) với 2 quạt ở phía trước và 1 quạt ở phía sau. Quạt được thắp sáng nhờ tổ hợp đèn LED phía trước case, bạn chỉ cần cắm điện và tận hưởng trải nghiệm. Các tấm lưới phía trước và phía trên cung cấp hệ thống thông gió tối ưu để di chuyển một lượng lớn không khí trong suốt vỏ máy.

Tản nhiệt Cooler Master Hyper 212 ARGB
Tản nhiệt Cooler Master Hyper 212 ARGB là thiết kế mới trong dòng sản phẩm Hyper 212 của thương hiệu Cooler Master. Phần cải tiến trong việc trang bị vây mới cho bộ sản phẩm giúp cho việc tản nhiệt tốt hơn. Với lượng gió được lưu thông mượt mà đảm bảo hiệu suất hoạt động tối ưu cho người dùng. 4 ống dẫn nhiệt bằng đồng được sắp xếp theo vị trí đã được tính toán khoa học từ chính thương hiệu.



 

Được sản xuất nhằm mang lại hiệu năng làm mát vượt trội cho quá trình dẫn khí nóng ra khỏi máy tính của bạn. Nếu bạn đang tìm một sản phẩm tản nhiệt tốt với mức giá ổn định thì đây là lựa chọn không thể bỏ qua. 



 

Nếu bạn thích góc máy làm việc, học tập và chơi game giải trí đậm màu sắc RGB độc đáo, ấn tượng thì bộ máy GVN MINION i3050 sẽ là một trong những sự lựa chọn không nên bỏ qua khi kết hợp cùng các thiết bị ngoại vi như bàn phím cơ, chuột máy tính đa kết nối từ chuột không dây đến có dây, tai nghe, miếng lót chuột led RGB,...<br> ', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (11, N'GVN VIPER Plus i3060 - White Edition', 5, 750.0000, N'https://product.hstatic.net/1000026716/product/1_eed761791f12407797e8db1bec20c034.jpg', N'Mainboard GIGABYTE B660M AORUS PRO AX DDR4 (rev. 1.0)
Đóng vai trò là bộ não của GVN VIPER Plus i3060 - White Edition, GIGABYTE B660M AORUS PRO AX DDR4 sở hữu những tính năng vượt trội cùng thiết kế nổi bật. Với các chi tiết như tấm tản nhiệt, khe M.2 được hoàn thiện với những đường nét tinh tế trắng và bạc nhám tạo nên vẻ ngoài bắt mắt. 



Sở hữu mọi tính năng cần thiết trên một chiếc bo mạch chủ hiện nay,GIGABYTE B660M AORUS PRO AX DDR4 mang đến hiệu năng mạnh mẽ cho gaming, tiện dụng cho các creator.

CPU Intel Core i5 12600KF
Intel Core i5 12600KF, con chip Intel Gen 12 mới nhất từ đội xanh được trang bị cho mình 10 nhân 16 luồng với 6 nhân P-Core (Hiệu năng) và 4 nhân E-Core (Hiệu quả) hướng đến hiệu năng mạnh mẽ nhất cho người dùng. Là CPU sinh ra với chipset mới nhất hiện nay như mainboard Z690, hỗ trợ RAM DDR5, thông qua đó sức mạnh của i5 12600KF sẽ được khai thác tối đa tốc độ 3.7GHz - tối đa đạt 4.9GHz. Sự lựa chọn tuyệt vời cho GVN VIPER Plus i3060 - White Edition.

GEARVN.COM - Intel Core i5 12600KF

RAM Corsair Vengeance Pro RGB 16GB (2x8GB) White
Hướng tới màu trắng hoàn thiện cho VIPER Plus i3060 - White Edition cùng khả năng đa nhiệm mượt mà, không ai khác ngoài RAM Corsair Vengeance Pro RGB White. Trang bị 2 kit RAM chạy dual-channel với dung lượng lên đến 16GB, Corsair Vengeance Pro RGB White mang đến tốc độ bus đạt 3200 cho khả năng xử lý dữ liệu mạnh mẽ cùng công nghệ XMP 2.0. 

GEARVN.COM - Ram Corsair Vengeance Pro RGB 16GB (2x8GB) 3200 White

Không những mạnh mẽ về hiệu năng, Corsair Vengeance Pro RGB White sở hữu vẻ ngoài bắt mắt với phần giáp tản nhiệt bằng nhôm màu trắng bắt mắt kết hợp với dải đèn LED RGB rực rỡ, đây sẽ góp phần tô điểm thêm cho dàn PC Gaming của bạn.

VGA GIGABYTE GeForce RTX 3060 VISION OC 12G
Card màn hình GIGABYTE GeForce RTX 3060 VISION OC mang lại khả năng xử lý đồ họa tuyệt vời cho GVN VIPER Plus i3060 - White Edition. Sở hữu công nghệ Ray Tracing cho hình ảnh mượt mà và bắt mắt đến cho người dùng cùng những công nghệ xử lý đồ họa như DLSS, tất cả sẽ nâng cấp trải nghiệm gaming của bạn lên một tầm cao mới.

GEARVN.COM - GIGABYTE GeForce RTX 3060 VISION OC 12G

Thiết kế 3 quạt cùng màu trắng tinh tế, GIGABYTE GeForce RTX 3060 VISION OC góp phần tô điểm thêm vẻ tinh khôi cho bộ PC Gaming cao cấp của chúng ta.

SSD Kingston NV1 250GB M.2 PCIe NVMe
Thêm một nhân tố từ Kingston, đó là bộ nhớ SSD với sản phẩm SSD Kingston NV1 250GB M.2 PCIe NVMe. Trang bị tốc độ đọc/ghi lần lượt là 2100/1700, SSD Kingston NV1 250GB M.2 PCIe NVMe sẽ đóng vai không gian lưu trữ cho các bạn.



Nguồn CoolerMaster MWE 750 BRONZE - V2 230V
Cung cấp năng lượng cho bộ PC sẽ là Cooler Master MWE 750. Đạt chuẩn 80 Plus Bronze cùng công suất đạt 750W, Cooler Master MWE 750 sẽ là PSU uy tín về chất lượng, đảm bảo nguồn điện cho những linh kiện máy tính như mainboard, VGA, CPU, … Thiết kế gọn gàng cùng phần dây Non-Modular, Cooler Master MWE 750 vô cùng phù hợp trong thiết kế của mọi case máy tính.



Case Cooler Master MASTERBOX TD500 Mesh White (3 fan ARGB)
Tất cả linh kiện được gói gọn trong chiếc Case Cooler Master MASTERBOX TD500 Mesh White (3 fan ARGB). Thuộc dạng Mid-Tower với tông màu chủ đạo là Matte White, tạo nên sự nhẹ nhàng và tinh tế đặt đúng tinh thần màu trắng của GVN VIPER Plus i3060 - White Edition.



Tản nhiệt nước NZXT AIO Kraken X53 RGB WHITE
Nhằm tăng cường khả năng hoạt động của mọi linh kiện trong case, không gì thích hợp hơn một bộ tản nhiệt AIO. Cái tên được chọn tiếp tục đến từ NZXT với model NZXT AIO Kraken X53 RGB WHITE. Thiết kế nhỏ gọn phù hợp với đại đa số case PC cùng dải sáng RGB trên nền màu trắng, NZXT AIO Kraken X53 RGB WHITE bật lên vẻ đẹp của mọi linh kiện trong case. Hiệu năng tản nhiệt mạnh mẽ góp phần vào khả năng hoạt động mạnh mẽ và bền bỉ cho GVN VIPER Plus i3060 - White Edition.

GEARVN.COM - Tản nhiệt nước NZXT AIO Kraken X53 RGB WHITE', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (12, N'GVN VIPER i1660S', 3, 850.0000, N'https://product.hstatic.net/1000026716/product/viper_i1660s_dcd29ccfff524dd280108c68dae13e4e.jpg', N'Bo mạch chủ MSI MAG B660M MORTAR WIFI DDR4
MSI MAG B660M MORTAR WIFI DDR4 là một trong những dòng mainboard được chắt lọc các yếu tố thiết yếu của nền tảng Intel mới nhất và kết hợp chúng để tạo thành một sản phẩm hoàn hảo trong phân khúc tầm trung. 



Được thiết kế với các thành phần tốt nhất, chiếc bo mạch chủ cung cấp đầy đủ những kết nối cơ bản giúp cuộc sống của bạn dễ dàng hơn. Việc được bọc thép sẽ làm giảm thiểu hiện tượng gẫy hay vặn xoắn khe PCI-E khi bạn chọn lắp những VGA lớn. Qua đó giúp tăng độ bền của sản phẩm và khả năng sang nhượng trong tương lai là sáng sủa hơn trông thấy.

Intel Core i5 12400F / 2.5GHz Turbo 4.4GHz / 6 Nhân 12 Luồng / 18MB / LGA 1700
CPU Intel Core i5-12400F đã khiến thị trường dòng chip tầm trung "nóng" hơn rất nhiều. Với 6 nhân 12 luồng, xung nhịp 2.5GHz và turbo boost lên 4.4GHz, quả là là sự chọn tuyệt vời cho việc chơi game cho tới stream game, vượt xa người tiền nhiệm i5-11400F khi không thể hoàn thành tốt việc stream game. 



6 nhân 12 luồng chỉ còn loanh quanh trong mức giá khoảng 5 triệu, cách đây khoảng 2 năm đây còn là điều không tưởng khi i7-8700 ra đời. Nhưng hiện taị mọi chuyện đã thay đổi khi Intel đã chính thức bước vào cuộc đua về thông số và giá cả với đối thủ truyền kiếp AMD, cơ hội để bạn sở hữu một dàn máy chất lượng chính là thời điểm hiện tại.

RAM Kingston Fury Beast 8GB 3200 DDR4 RGB


RAM của hệ thống là dòng sản phẩm Fury Beast 8GB 3200 DDR4 RGB của thương hiệu lâu đời và danh tiếng - KINGSTON có khả năng tự ép xung để nâng cao hiệu suất hoạt động trên toàn hệ thống.

ASUS TUF Gaming GeForce GTX 1660 SUPER OC edition 6GB GDDR6
GVN VIPER i1660S sử dụng dòng card màn hình với nhiều tính năng nổi trội. Điểm đặc biệt nhất đó chính là hệ thống làm mát, cùng một số cải tiến để mang lại hiệu quả cao hơn.



Cánh quạt của hệ thống làm mát quay luân phiên, giải quyết luồng không khí hỗn loạn của các quạt liền kề. Nếu như trước đây các dòng quạt liền kề xe được thiết kế để quay cùng một chiều. Hiện tại các dòng card màn hình đã cải tiến để các quạt quay ngược chiều nhau. Làm giảm tình trạng các luồng khí hỗn loạn và hạn chế card màn hình nóng lên trong lúc làm việc.

Kingston NV1 250GB M.2 PCIe NVMe


 

Tất cả các sản phẩm của Kingston được sản xuất và thử nghiệm nghiêm ngặt trước khi xuất xưởng. Ổ cứng Kingston NV1 250GB chất lượng cao từ các nhà cung cấp hàng đầu của ngành công nghiệp để đảm bảo chất lượng cực cao. Ổ cứng Kingston hoàn toàn tương thích trên tất cả các ứng dụng và môi trường để đảm bảo đáp ứng các tiêu chuẩn chất lượng, độ tin cậy và độ bền cao nhất.

Nguồn SilverStone ST65F-ES230 - 80 Plus


 

Chứng nhận 80 Plus đảm bảo hiệu suất hoạt động tốt hơn. Ít lãng phí điện năng, làm giảm nhiệt và tiếng ồn của quạt. Nguồn SilverStone ST65F-ES230 - 80 Plus có thể đạt hiệu suất lên tới 80%. Nguồn SilverStone ST65F-ES230 - 80 Plus cung cấp giải pháp tốt nhất cho việc xây dựng hệ thống PC gaming. 

Cáp bện lưới làm giảm sự lộn xộn và cải thiện luồng không khí trong case. Tất cả các tụ điện là tụ điện chất lượng cao, để tạo ra hiệu suất hiệu quả và đảm bảo độ tin cậy lâu hơn. 
Đường Single rail + 12V cung cấp năng lượng tốt nhất, ổn định và tương thích cho phần cứng. Và nó là thiết kế tốt nhất để cài đặt. 
Quạt vòng bi thủy lực 120mm tối ưu hóa việc giảm tiếng ồn và hiệu suất nhiệt. Tốc độ quạt được điều chỉnh tự động theo hoạt động của nguồn. Quạt thủy lực cho tuổi thọ dài hơn và ổn định hơn.
Case Deepcool MATREXX 40 3FS (3 fan RGB)
Tuy là case khá nhỏ gọn nhưng được hỗ trợ khả năng làm mát cực kỳ ấn tượng với ba quạt LED đi cùng. Cùng với đó case được trang bị một tấm kính cường lực mặt bên để tăng thêm tính thẩm mỹ của vỏ case. 



Ba quạt 120mm được cài đặt sẵn trong Case Deepcool MATREXX 40 3FS (3 fan RGB) với 2 quạt ở phía trước và 1 quạt ở phía sau. Quạt được thắp sáng nhờ tổ hợp đèn LED phía trước case, bạn chỉ cần cắm điện và tận hưởng trải nghiệm. Các tấm lưới phía trước và phía trên cung cấp hệ thống thông gió tối ưu để di chuyển một lượng lớn không khí trong suốt vỏ máy.

Tản nhiệt DEEPCOOL AG400 ARGB
Để nâng cấp hiệu năng cho bộ máy, GVN VIPER i1660S được trang bị hệ thống Tản nhiệt DEEPCOOL AG400 ARGB. Sở hữu thiết kế cánh quạt tối ưu luồng gió và áp suất gió làm mát bộ máy khi vận hành. Dễ dàng kết nối với các bo mạch chủ có trên thị trường ở nhiều phân khúc khác nhau. Cùng với đó là 4 ống dẫn nhiệt sử dụng công nghệ Direct Contact đảm bảo bề mặt tiếp xúc tốt.

', 0, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (13, N'Laptop gaming ASUS TUF Dash F15 FX517ZE HN888W', 10, 1100.0000, N'https://product.hstatic.net/1000026716/product/hn888w_5dd5c18b72e54f1083a8f1a37ad5bb81.png', N'1x Thunderbolt 4 support DisplayPort
1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC
2x USB 3.2 Gen 1 Type-A
1x HDMI 2.0b
1x RJ45
1x 3.5mm Combo Audio Jack', 1, N'1', 1)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (14, N'Laptop gaming Acer Predator Helios 300 PH315 55 751D', 15, 1350.0000, N'https://product.hstatic.net/1000026716/product/751_8c7bdc9120554e21bcf7ff7defe5eb99.png', N'1 x USB 3.2 Gen 2 port featuring power-off USB charging,
1 x USB 3.2 Gen 2 port,
1 x USB 3.2 Gen 1 port,
1 x HDMI®2.1 port with HDCP support,
1 x Mini DisplayPort 1.4 
1 x 3.5 mm headphone/speaker jack, supporting headsets with built-in microphone', 1, N'1', 1)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (15, N'Laptop gaming MSI Katana GF66 11UC 224VN', 18, 1450.0000, N'https://product.hstatic.net/1000026716/product/224vn-w10_6f9cd0624e764b5f8e27f60072e51f9f.png', N'1x (4K @ 60Hz) HDMI
1x Type-A USB2.0
2x Type-A USB3.2 Gen1
1x Type-C USB3.2 Gen1
1x RJ45
1x Mic-in/Headphone-out Combo Jack', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (16, N'Laptop Lenovo IdeaPad Gaming 3 15IHU6 82K101B5VN', 23, 1560.0000, N'https://product.hstatic.net/1000026716/product/gearvn-laptop-lenovo-ideapad-gaming-3-15ihu6-82k101b5vn-1_a8ae2d21b6e5454bab7bd0f7476cf29b.png', N'1x USB-C 3.2 Gen 1 (support data transfer only)
2x USB 3.2 Gen 1
1x HDMI 2.0
1x RJ-45
1x headphone / microphone combo jack (3.5mm)
1x power connector', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (17, N'Laptop gaming Acer Nitro 5 AN515 58 52SP', 24, 1125.0000, N'https://product.hstatic.net/1000026716/product/52sp_f272f2caf7c649a48f4eec639cdb1d1c.png', N'1x USB 3.2 Gen 2 Type-C Ports (supporting: USB 3.2 Gen 2 (up to 10 Gbps); DisplayPort over USB-C; Thunderbolt 4; USB charging 5 V; 3 A; DC-in port 20 V; 65 W)
1x USB 3.2 Gen 2 port featuring power-off USB charging
1x USB 3.2 Gen 2 port
1x USB 3.2 Gen 1 port
1x Ethernet (RJ-45) port
1x HDMI®2.1 port with HDCP support
1x 3.5 mm headphone/speaker jack, supporting headsets with built-in microphone
1x DC-in jack for AC adapter', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (18, N'Laptop gaming Dell G15 5515 P105F004DGR', 12, 1205.0000, N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-dell-g15-5515-p105f004dgr-1_341f1c25004847e18398d9852c48b220.png', N'QUÀ TẶNG:

🎁 Túi chống sốc Gearvn.

🎁 Túi xách Dell

🎁 Nón AMD cực ngầu (Từ 01.08 - 24.09.2022)

🎁 Lootbox Standard GEARVN trị giá 600.000đ: (Từ 22.08 - 30.09.2022)

+ Chuột Logitech G102

+ Lót chuột Steelseries QCK mini', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (19, N'Laptop Gaming Acer Nitro 5 Eagle AN515 57 5669', 22, 1040.0000, N'https://product.hstatic.net/1000026716/product/5669_25fd0bc3480546de90d6cb6afdfbc62a.png', N'Acer vừa ra mắt phiên bản mới nhất của dòng game Nitro 5 - Nitro 5 Eagle AN515-57 được trang bị bộ vi xử lý Intel Core thế hệ thứ 11, hai tùy chọn CPU Intel Core i5-11400H, GPU NVIDIA GeForce GTX 1650 4GB và tốc độ làm mới 144Hz cùng với hỗ trợ bàn phím RGB. Với sự kết hợp từ CPU Core i5 -11400H và GPU NVIDIA GeForce GTX 1650 4GB, Acer Nitro 5 Eagle AN515-57 sẽ cho chúng ta hiệu năng tốt để xử lý các công việc đồ họa đơn giản trên các phần mềm chuyên dụng, tốc độ xử lý thông tin cũng tương đối nhanh và mượt mà. 

Hơn nữa, card đồ họa NVIDIA GeForce GTX 1650 4GB được hỗ trợ bởi hiệu suất đồ họa cải tiến của NVIDIA Turing sẽ mang đến trải nghiệm chơi game tuyệt vời dưới cấu hình đồ họa cao những vẫn tiết kiệm năng lượng.', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (20, N'Laptop Gaming Asus ROG Strix G15 G513IH HN015W', 6, 1220.0000, N'https://product.hstatic.net/1000026716/product/g513_b4baf05245814c1cb7554349231e1d7f.png', N'Laptop Gaming ngày nay được rất nhiều khách hàng lựa chọn nhằm phục vụ nhu cầu giải trí cao với các tựa game cấu hình nặng mà những chiếc laptop văn phòng không thể đáp ứng được. Asus ROG Strix G15 G513IH HN015W được ra đời nhằm mang đến những phút giây thăng hoa cho người dùng được thỏa sức đắm chìm vào các tựa game yêu thích của họ.', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (21, N'Laptop gaming ASUS TUF Gaming F15 FX506HM HN366W', 11, 1445.0000, N'https://product.hstatic.net/1000026716/product/gearvn-laptop-gaming-asus-tuf-gaming-f15-fx506hm-hn366w-1_548d088f798e4c549bccc4df36b30993.png', N'Hiệu năng cực đỉnh cho mọi tác vụ
Hiệu năng đáng tin cậy trên ASUS TUF Gaming F15 FX506HM HN366W giúp bạn chơi game, livestream và thực hiện đa tác vụ. CPU Intel i7 tốc độ cao có thể kích hoạt nhiều luồng để xử lý đa nhiệm. Kết hợp với card màn hình RTX 3060, đáp ứng tốc độ khung hình cao của nhiều tựa game phổ biến. Tăng tốc độ tải ứng dụng với ổ SSD 512GB NVMe PCIe® và dễ dàng nâng cấp khả năng lưu trữ với ổ SSD thứ hai.', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (22, N'Laptop ASUS Vivobook 15X OLED A1503ZA L1421W', 12, 980.0000, N'https://product.hstatic.net/1000026716/product/l1421w_2b115562199d462b82b92e89e95b2473.png', N'Cấu hình vượt trội trên laptop Asus Vivobook 15X OLED A1503ZA L1421W
Sử dụng CPU Intel core i5-12500H thế hệ 12 mạnh mẽ cho phép Asus OLED Vivobook 15X giải quyết mọi tác vụ văn phòng cơ bản đến nâng cao. Việc làm đồ họa cơ bản trên máy cũng được hỗ trợ với VGA tích hợp Intel® Iris Xe Graphics. 8GB RAM DDR4 xử lý đa nhiệm nhanh chóng cho những thao tác mượt mà. Bộ lưu trữ 512GB thỏa sức lưu trữ các dữ liệu quan trọng mà người dùng cần.', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (23, N'Laptop Asus ZenBook 13 UX325EA KG656W', 22, 1120.0000, N'https://product.hstatic.net/1000026716/product/laptop-asus-zenbook-ux325ea-kg656w_33160483676c416081a2d4c83e86306f.png', N'Laptop Asus ZenBook UX325EA KG656W được thiết kế gọn nhẹ hơn bao giờ hết. Sản phẩm mỏng hơn, nhẹ hơn và gọn gàng khó tin nhưng vẫn được trang bị HDMI, Thunderbolt™ 4 USB-C®, USB Type-A và đầu đọc thẻ MicroSD. Đây là dòng laptop cao cấp mỏng nhẹ mang lại hiệu suất làm việc cao. ZenBook 13 là lựa chọn hoàn hảo cho phong cách sống năng động. ', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (24, N'Laptop MSI Modern 15 A5M 239VN', 24, 997.0000, N'https://product.hstatic.net/1000026716/product/gearvn-laptop-msi-modern-15-a5m-239vn-1_ddf341e82d2c4afcbcff253a76f13ceb.jpg', N'Màn hình tiên tiến
Được trang bị màn hình máy tính viền mỏng 15.6 inch kết hợp độ phân giải FullHD đem đến chất lượng hiển thị sống động và sắc nét, là sự nâng cấp về kích thước so với MSI Modern 14 trước đây. Ngoài ra, các thông số khác như IPS-Level là điểm cộng cho máy để người dùng thực hiện công việc sáng tạo, thiết kế, chỉnh sửa ảnh và video cơ bản tốt nhất.

', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (26, N'Laptop Dell Latitude 3520 P108F001', 33, 1222.0000, N'https://product.hstatic.net/1000026716/product/laptop-dell-latitude-3520-p108f001-70280536_2115b3f037b047e38cfa53371ffcb490.jpg', N'Laptop Dell Latitude 3520 P108F001 70280536 sở hữu thiết kế đơn giản, sang trọng
Laptop Dell thường có thiết kế khá dày và nặng nề, điều này gây không ít khó khăn cho người sử dụng. Hiểu được điều ấy Dell Latitude 3520 70280536 đã cải tiến để máy trở nên mỏng nhẹ hơn với kích thước ba chiều lần lượt là 18.06 x 361 x 240.9 mm cùng khối lượng 1.79 kg. Giờ đây bạn bạn có thể đặt vừa chiếc laptop trong balo của mình và mang đi dễ dàng.

Máy sử dụng tone màu đen cổ điển làm chủ đạo với logo Dell màu trắng đặt tại vị trí trung tâm mặt trên của máy. Đây là thiết kế khá phù hợp với gần như mọi lứa tuổi khách hàng, phù hợp với mọi bối cảnh. Màu đen không bị xuống màu giúp giữ cho máy luôn bền đẹp dù qua thời gian dài sử dụng.

', 1, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (27, N'Laptop HP Pavilion 15 EG2036TX 6K782PA', 44, 2111.0000, N'https://product.hstatic.net/1000026716/product/1_726e3cb5e5864b7999040c221f610f32.png', N'Công nghệ sạc nhanh tiên tiến
HP Pavilion 15 được trang bị công nghệ tấm nền hiện đại và công nghệ sạc pin nhanh 90% chỉ trong vòng 90 phút sạc. Điều này giúp tăng tính cơ động cho máy, giúp bạn có thể thoải mái sử dụng máy cả ngày dài ở bất cứ nơi nào với viên pin tích hợp mà không cần đến nguồn sạc hay lo lắng đến vấn đề sạc pin.

Trải nghiệm giải trí đỉnh cao
Laptop được trang bị loa kép audio cùng công nghệ khuếch âm HP Audio Boost cùng âm thanh được tinh chỉnh bởi các chuyên gia của B&O PLAY. Sự kết hợp này đang đem đến cho người dùng trải nghiệm âm nhạc với chiều sâu chân thực và đầy sống động. Bên cạnh đó, loa được đặt ở vị trí trên bàn phím. Do đó, cho dù người dùng thoải mái đặt máy ở bất cứ đâu, chất lượng âm thanh cũng sẽ không bị ảnh hưởng hay khác biệt nhiều.', 0, N'1', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (28, N'GVN TITAN Plus i3090Ti', 2, 699.0000, N'https://product.hstatic.net/1000026716/product/1_599f5f07a504443c9ca2b05318e1d8a4.jpg', N'Thông số kỹ thuật:

Mainboard 	MSI MPG Z690 FORCE WIFI DDR5	36 Tháng
CPU 	Intel Core i9 12900K / 3.2GHz Turbo 5.2GHz / 16 Nhân 24 Luồng / 30MB / LGA 1700	36 Tháng
RAM 	Kingston Fury Beast RGB 32GB (2x16GB) bus 5200 DDR5	36 Tháng
VGA 	MSI GeForce RTX 3090 Ti Suprim X 24G	36 Tháng
HDD	Tùy chọn nâng cấp	24 Tháng
PSU 	MSI MPG A1000GF - 80 Plus Gold - Full modular	120 Tháng
CASE	MSI MAG VAMPIRIC 300R 	12 Tháng
FAN	Cooler Master SICKLEFLOW 120 ARGB 3 IN 1	12 tháng', 1, N'2', 1)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (29, N'GVN VIPER i2060', 3, 899.0000, N'https://product.hstatic.net/1000026716/product/1_e5c97edf405046eb96fc7896e3c56087.jpg', N'Thông số kỹ thuật:
Mainboard	MSI MAG B660M MORTAR WIFI DDR4	36 Tháng
CPU	Intel Core i5 12400F / 2.5GHz Turbo 4.4GHz / 6 Nhân 12 Luồng / 18MB / LGA 1700	36 Tháng
RAM	PNY XLR8 Silver 1x8GB 3600 RGB	36 Tháng
VGA 	GIGABYTE GeForce RTX 2060 D6 6G	36 Tháng
HDD	Có thể tùy chọn Nâng cấp	24 Tháng
SSD	Kingston NV1 250GB M.2 PCIe NVMe	36 Tháng
PSU	SilverStone ST65F-ES230 - 80 Plus	36 Tháng
Cooling	Tản nhiệt DEEPCOOL AG400 ARGB	12 Tháng
Case	Case Asus TUF GT301 (3 fan RGB)	24 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (30, N'GVN TITAN Plus i3090', 1, 799.0000, N'https://product.hstatic.net/1000026716/product/1_7d296dfbc0e740bb96a13c9ff3393c7d.jpg', N'Thông số kỹ thuật:

Mainboard 	ASUS ROG MAXIMUS Z690 FORMULA DDR5	36 Tháng
CPU 	Intel Core i9 12900KS / 3.4GHz Turbo 5.5GHz / 16 Nhân 24 Luồng / 30MB / LGA 1700	36 Tháng
RAM 	Corsair Dominator Platinum 32GB (2x16GB) RGB 5600 DDR5 White	36 Tháng
RAM 	Corsair Dominator Platinum 32GB (2x16GB) RGB 5600 DDR5 White	36 Tháng
VGA 	ASUS ROG Strix GeForce RTX 3090 Gaming White OC edition 24G	36 Tháng
SSD 	SamSung 980 PRO 1TB M.2 PCIe gen 4 NVMe (MZ-V8P1T0BW)	60 Tháng
HDD	Tùy chọn nâng cấp	24 Tháng
PSU 	ASUS Rog Thor 1200P - 80 Plus Platinum - Full Modular	120 Tháng
CASE	ASUS ROG Strix Helios GX601 White Edition 	24 Tháng
Cooling 	ASUS ROG STRIX LC II 360 ARGB White Edition	72 Tháng
Quạt	Corsair LL120 RGB LED 120mm White — Triple Pack with Lighting Node PRO	24 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (31, N'GVN VIPER i3050', 4, 599.0000, N'https://product.hstatic.net/1000026716/product/2_1649a388894f4ddabf6880f6a73c710f.jpg', N'Thông số kỹ thuật:

Mainboard 	MSI MAG B660M MORTAR WIFI DDR4	36 Tháng
CPU	Intel Core i5 12400F / 2.5GHz Turbo 4.4GHz / 6 Nhân 12 Luồng / 18MB / LGA 1700	36 Tháng
RAM 	PNY XLR8 Silver 1x8GB 3600 RGB x 2	36 Tháng
VGA 	GIGABYTE GeForce RTX 3050 EAGLE OC 8G	36 Tháng
HDD 	Có thể tùy chọn nâng cấp	24 Tháng
SSD 	MSI Spatium M390 250GB M.2 PCIe NVMe	60 Tháng
PSU 	SilverStone ST65F-ES230 - 80 Plus	36 Tháng
Case 	1st Player XF White (4 fan RGB)	12 Tháng
Cooling	ID COOLING SE-214-XT ARGB WHITE	12 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (32, N'GVN MINION i1650', 2, 499.0000, N'https://product.hstatic.net/1000026716/product/1_c9ff8f05ad92414fb21f5ad085564ebe.jpg', N'Thông số kỹ thuật:
Mainboard	ASUS PRIME H510M-A WIFI	36 Tháng
CPU	Intel Core i3 10105F / 6MB / 4.4GHZ / 4 nhân 8 luồng / LGA 1200	36 Tháng
RAM	Kingston Fury Beast 8GB 3200 DDR4 RGB (KF432C16BBA/8)	36 Tháng
VGA	GIGABYTE GeForce GTX 1650 OC 4G	36 Tháng
HDD	Có thể tùy chọn Nâng cấp	24 Tháng
SSD	SSD KIMTIGO 240GB 2.5" SATA III	36 Tháng
PSU	Deepcool PF450D - 80 Plus	36 Tháng
Case 	XIGMATEK FADIL ARCTIC 1F (1 fan RGB)	12 Tháng
Tản	ID COOLING SE-214-XT ARGB WHITE	12 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (33, N'GVN VIPER Plus i3060', 3, 599.0000, N'https://product.hstatic.net/1000026716/product/2_3671556ea6394514a50c06138e875901.jpg', N'Thông số kỹ thuật:

Mainboard 	MSI MAG B660M MORTAR WIFI DDR4	36 Tháng
CPU	Intel Core i5 12600KF / 3.7GHz Turbo 4.9GHz / 10 Nhân 16 Luồng / 20MB / LGA 1700	36 Tháng
RAM 	PNY XLR8 Silver 8GB 3600 RGB x 2	36 Tháng
VGA 	ASUS Dual GeForce RTX 3060 V2 12GB GDDR6 (LHR)	36 Tháng
HDD 	Có thể tùy chọn nâng cấp	24 Tháng
SSD 	MSI Spatium M390 250GB M.2 PCIe NVMe	60 Tháng
PSU 	Nguồn CoolerMaster MWE 750 BRONZE - V2 230V	60 Tháng
Case 	Case Asus TUF GT301 (3 fan RGB)	24 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (34, N'GVN VIPER Plus i3070', 2, 699.0000, N'https://product.hstatic.net/1000026716/product/1_de3a14a8969c433fbe31ed9ddee5997f.jpg', N'Thông số kỹ thuật:
Mainboard 	MSI MAG B660M MORTAR WIFI DDR4	36 Tháng
CPU	Intel Core i5 12600KF / 3.7GHz Turbo 4.9GHz / 10 Nhân 16 Luồng / 20MB / LGA 1700	36 Tháng
RAM 	Kingston Fury Beast 8GB 3200 DDR4 RGB	36 Tháng
VGA 	MSI GeForce RTX 3070 GAMING Z TRIO 8GB (LHR)	36 Tháng
HDD 	Có thể tùy chọn nâng cấp	24 Tháng
SSD 	MSI Spatium M390 250GB M.2 PCIe NVMe	60 Tháng
PSU 	Corsair RM750e - 80 Plus Gold - Full Modular	120 Tháng
Case 	Case Deepcool CG540 4F Tempered Glass (3 fan ARGB)	12 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (35, N'GVN MINION i1660S', 3, 820.0000, N'https://product.hstatic.net/1000026716/product/minion_i1660s_20554623778e42b18d79afffe0e18f8a.jpg', N'CẤU HÌNH CHI TIẾT SẢN PHẨM GVN MINION i1660S:

Mainboard	GIGABYTE H510M S2H (rev. 1.0)	36 Tháng
CPU	Intel Core i3 10105F / 6MB / 4.4GHZ / 4 nhân 8 luồng / LGA 1200	36 Tháng
RAM	Kingston Fury Beast 8GB 3200 DDR4 RGB (KF432C16BBA/8)	36 Tháng
VGA - Card đồ họa	Gigabyte GeForce GTX 1660 SUPER OC 6GB GDDR6	36 Tháng
HDD	Có thể tùy chọn Nâng cấp	24 Tháng
SSD	SSD KIMTIGO 240GB 2.5" SATA III	36 Tháng
PSU	SilverStone ST50F-ES230 - 80 Plus	36 Tháng
Case 	Case Deepcool MATREXX 40 3FS	12 Tháng
Tản nhiệt	Tản nhiệt ID COOLING SE-214 XT	12 Tháng
Wifi + Bluetooth	Card mạng PCIe WiFi 5 Gigabyte GC-WB1733D-I	12 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (36, N'GVN PHANTOM i3060', 2, 899.0000, N'https://product.hstatic.net/1000026716/product/1_59b0109a9a474d1ea14c2895bcd4f39a.jpg', N'Thông số kỹ thuật:

Mainboard 	MSI MAG Z690 TOMAHAWK WIFI DDR4	36 Tháng
CPU	Intel Core i7 12700F / 2.1GHz Turbo 4.9GHz / 12 Nhân 20 Luồng / 25MB / LGA 1700	36 Tháng
RAM 	Kingston Fury Beast 8GB 3200 DDR4 RGB x 2	36 Tháng
VGA	ASUS Dual GeForce RTX 3060 V2 12GB GDDR6 (LHR)	36 Tháng
HDD 	Có thể tùy chọn nâng cấp	24 Tháng
SSD 	MSI Spatium M390 500GB M.2 PCIe NVMe	60 Tháng
PSU 	CoolerMaster MWE 750 BRONZE - V2 230V	60 Tháng
Case 	Case Asus TUF GT301 (3 fan RGB)	24 Tháng
Cooling	Cooler Master MASTERLIQUID ML240 MIRROR	24 Tháng', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (37, N'G-Studio X', 4, 999.0000, N'https://product.hstatic.net/1000026716/product/gstudiox_87ea0c1c7f264a0aa53fdc268977336e.jpg', N'GVN G-Studio X
- Mainboard 	ASUS ROG Strix TRX40-XE Gaming	36 Tháng
- CPU 	AMD Ryzen Threadripper 3960X / 3.8GHz Boost 4.5GHz / 24 nhân 48 luồng / 128MB / sTRX4	36 Tháng
- RAM	Corsair Vengeance Pro RS RGB 2x16GB 3200 (CMG32GX4M2E3200C16)	36 Tháng
- VGA	ASUS ROG Strix GeForce RTX​ 3070 Ti O8G GDDR6X	36 Tháng
- HDD	Tùy chọn	24 Tháng
- SSD	SamSung 980 PRO 1TB M.2 PCIe gen 4 NVMe (MZ-V8P1T0BW)	60 Tháng
- PSU	Corsair HX1200 - 80 Plus Platinum - Full Modular	120 Tháng
- Case	Corsair 4000D AIRFLOW Black	24 Tháng
- Tản nhiệt	Noctua NH - U14S-TR4-SP3	72 Tháng
', 1, N'2', NULL)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId], [provider_id]) VALUES (38, N'GVN PHANTOM i3070', 2, 1999.0000, N'https://product.hstatic.net/1000026716/product/2_8696fb4d953d4f40b83e458023801f71.jpg', N'Thông số kỹ thuật:
Mainboard 	GIGABYTE Z690 AORUS ELITE AX DDR4 (rev. 1.0) V2	36 Tháng
CPU	Intel Core i7 12700F / 2.1GHz Turbo 4.9GHz / 12 Nhân 20 Luồng / 25MB / LGA 1700	36 Tháng
RAM 	PNY XLR8 Silver 1x8GB 3600 RGB x 2	36 Tháng
VGA 	GIGABYTE AORUS GeForce RTX 3070 MASTER 8G	36 Tháng
HDD 	Có thể tùy chọn nâng cấp	24 Tháng
SSD 	Kingston NV1 500GB M.2 PCIe NVMe	36 Tháng
PSU 	CoolerMaster MWE 750 BRONZE - V2 230V	60 Tháng
Case 	GIGABYTE AORUS C300 Glass	12 Tháng
Cooling	Cooler Master MASTERLIQUID PL240 FLUX	36 Tháng', 0, N'2', NULL)
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([provider_id], [provider_name], [provider_email], [provider_address], [provider_status]) VALUES (1, N'Nguyen Van Sang', N'SangNV123@fpt.edu.vn', N'Ha Noi, Viet Nam', N'1         ')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (1, N'User')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (2, N'Admin')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (3, N'Provider')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (4, N'Manager')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (1, 1, N'ABC', N'hà n?i', N'1009', NULL, N'male', N'123', 1, NULL)
INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (2, 1, N'Nguyen Quang Huy', N'ha long', N'0327125339', NULL, N'Huy', N'123', 1, NULL)
INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (3, 1, N'Hang', N'da nang', N'0214091131', NULL, N'female', N'456', 0, NULL)
INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (4, 3, N'Hanh', N'ho chi minh', N'0458399167', NULL, N'female', N'789', 0, NULL)
INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (5, 2, N'Nguyen Quang Huy', N'&#272;ai Lo Thang Long KM29, Th&#7841;ch Hoa, Th&#7841;ch That', N'0327125339', NULL, N'Huyy', N'1', 1, NULL)
INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (6, 4, N'Nguyen Zack', N'Phòng 401, Chung Cu Xanh Hong Gai', N'0327125339', N'zacknguyen28@gmail.com', N'ZackNguyen', N'ukqkvyiikf', 1, NULL)
INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (9, 1, N'Nguy?n Quang Huy', N'Ð?i h?c FPT, Th?ch Th?t, Hà N?i', N'0327125339', N'huynqhe130759@fpt.edu.vn', N'Drackerla', N'14061999DayHuyDay', 1, 1)
INSERT [dbo].[User] ([cid], [roleid], [fullName], [address], [phone], [email], [username], [password], [status], [gender]) VALUES (10, 1, N'Nguy?n Quang Huy', N'Ð?i H?c FBT Hà N?i', N'0988829556', N'nguyenhuy14006@gmail.com', N'ThisIsHuy', N'14061999', 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__BD4278AE8E24916B]    Script Date: 9/22/2022 12:51:14 AM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[cateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__status__32E0915F]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__Customer__status__31EC6D26]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([cid])
REFERENCES [dbo].[User] ([cid])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK__BillDetail__bid__34C8D9D1] FOREIGN KEY([bid])
REFERENCES [dbo].[Bill] ([bid])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK__BillDetail__bid__34C8D9D1]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK__BillDetail__pid__35BCFE0A] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK__BillDetail__pid__35BCFE0A]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([cid])
REFERENCES [dbo].[User] ([cid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__cateId__36B12243] FOREIGN KEY([cateId])
REFERENCES [dbo].[Category] ([cateId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__cateId__36B12243]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([provider_id])
REFERENCES [dbo].[Provider] ([provider_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_User] FOREIGN KEY([cid])
REFERENCES [dbo].[User] ([cid])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [SWDHutech] SET  READ_WRITE 
GO
