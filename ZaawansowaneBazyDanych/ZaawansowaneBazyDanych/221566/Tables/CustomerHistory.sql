CREATE TABLE [221566].[CustomerHistory] (
    [CustomerID]   INT                    NOT NULL,
    [NameStyle]    [dbo].[NameStyle]      NOT NULL,
    [Title]        NVARCHAR (8)           NULL,
    [FirstName]    [dbo].[Name]           NOT NULL,
    [MiddleName]   [dbo].[Name]           NULL,
    [LastName]     [F6_surname].[Surname] NOT NULL,
    [Suffix]       NVARCHAR (10)          NULL,
    [CompanyName]  NVARCHAR (128)         NULL,
    [SalesPerson]  NVARCHAR (256)         NULL,
    [EmailAddress] NVARCHAR (50)          NULL,
    [Phone]        [dbo].[Phone]          NULL,
    [PasswordHash] VARCHAR (128)          NOT NULL,
    [PasswordSalt] VARCHAR (10)           NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER       NOT NULL,
    [ModifiedDate] DATETIME               NOT NULL,
    [ValidFrom]    DATETIME2 (7)          NOT NULL,
    [ValidTo]      DATETIME2 (7)          NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_CustomerHistory]
    ON [221566].[CustomerHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

