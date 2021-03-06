SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetadataGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[GroupOwnerUserID] [int] NOT NULL,
	[IsRestrictedEdit] [bit] NOT NULL,
 CONSTRAINT [PK_MetadataGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[MetadataGroup] ADD  CONSTRAINT [DF_MetadataGroup_IsEditRestricted]  DEFAULT ((0)) FOR [IsRestrictedEdit]
GO
ALTER TABLE [dbo].[MetadataGroup]  WITH CHECK ADD  CONSTRAINT [FK_MetadataGroup_User] FOREIGN KEY([GroupOwnerUserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[MetadataGroup] CHECK CONSTRAINT [FK_MetadataGroup_User]
GO
