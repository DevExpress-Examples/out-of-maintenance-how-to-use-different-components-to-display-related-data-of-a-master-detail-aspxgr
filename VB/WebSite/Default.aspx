<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default"
	EnableEventValidation="false" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to use different components to display related data of a master-detail ASPxGridView
	</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxGridView ID="masterGrid" runat="server" AutoGenerateColumns="False" DataSourceID="dsMainGrid"
			Width="100%" KeyFieldName="OrderID">
			<Templates>
				<DetailRow>
					<dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
						<TabPages>
							<dx:TabPage>
								<ContentCollection>
									<dx:ContentControl ID="ContentControl1" runat="server">
										<dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="dsTreeList"
											KeyFieldName="EmployeeID" OnInit="ASPxTreeList1_Init" ParentFieldName="ReportsTo"
											Width="100%">
											<Columns>
												<dx:TreeListTextColumn FieldName="FirstName" VisibleIndex="0">
												</dx:TreeListTextColumn>
												<dx:TreeListTextColumn FieldName="LastName" VisibleIndex="0">
												</dx:TreeListTextColumn>
												<dx:TreeListTextColumn FieldName="Title" VisibleIndex="0">
												</dx:TreeListTextColumn>
											</Columns>
										</dx:ASPxTreeList>
									</dx:ContentControl>
								</ContentCollection>
							</dx:TabPage>
							<dx:TabPage>
								<ContentCollection>
									<dx:ContentControl ID="ContentControl3" runat="server">
										<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID"
											Style="margin-right: 0px" OnDataBinding="GridView1_DataBinding">
											<Columns>
												<asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
												<asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
												<asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
												<asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
											</Columns>
										</asp:GridView>
									</dx:ContentControl>
								</ContentCollection>
							</dx:TabPage>
							<dx:TabPage>
								<ContentCollection>
									<dx:ContentControl ID="ContentControl2" runat="server">
										<dx:ASPxGridView ID="detailGrid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail"
											KeyFieldName="CustomerID" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect"
											Width="100%">
											<Columns>
												<dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="1">
												</dx:GridViewDataTextColumn>
												<dx:GridViewDataTextColumn FieldName="ContactName" VisibleIndex="2">
												</dx:GridViewDataTextColumn>
												<dx:GridViewDataTextColumn FieldName="ContactTitle" VisibleIndex="3">
												</dx:GridViewDataTextColumn>
												<dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="4">
												</dx:GridViewDataTextColumn>
											</Columns>
										</dx:ASPxGridView>
									</dx:ContentControl>
								</ContentCollection>
							</dx:TabPage>
						</TabPages>
					</dx:ASPxPageControl>
				</DetailRow>
			</Templates>
			<Columns>
				<dx:GridViewDataTextColumn FieldName="ShipName" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ShipAddress" VisibleIndex="4">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ShipCity" VisibleIndex="5">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ShipCountry" VisibleIndex="6">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="7">
				</dx:GridViewDataDateColumn>
				<dx:GridViewDataDateColumn FieldName="RequiredDate" VisibleIndex="8">
				</dx:GridViewDataDateColumn>
				<dx:GridViewDataDateColumn FieldName="ShippedDate" VisibleIndex="9">
				</dx:GridViewDataDateColumn>
			</Columns>
			<SettingsDetail ShowDetailRow="True" />
		</dx:ASPxGridView>
		<asp:AccessDataSource ID="dsMainGrid" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [OrderID], [CustomerID], [EmployeeID], [ShipName], [ShipAddress], [ShipCity], [ShipCountry], [OrderDate], [RequiredDate], [ShippedDate] FROM [Orders]">
		</asp:AccessDataSource>
		<asp:AccessDataSource ID="dsTreeList" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [ReportsTo] FROM [Employees]">
		</asp:AccessDataSource>
		<asp:AccessDataSource ID="dsDetail" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address] FROM [Customers] WHERE ([CustomerID] = ?)">
			<SelectParameters>
				<asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="String" />
			</SelectParameters>
		</asp:AccessDataSource>
		<asp:AccessDataSource ID="dsDetailView" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [Address], [City] FROM [Employees] WHERE ([EmployeeID] = ?)">
			<SelectParameters>
				<asp:Parameter Name="EmployeeID" Type="Int32" DefaultValue="EmployeeID" />
			</SelectParameters>
		</asp:AccessDataSource>
	</div>
	</form>
</body>
</html>