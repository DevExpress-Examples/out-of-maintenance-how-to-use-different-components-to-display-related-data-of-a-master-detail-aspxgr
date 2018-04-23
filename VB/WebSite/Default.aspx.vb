Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxTreeList
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		masterGrid.DataBind()
	End Sub

	Protected Sub ASPxTreeList1_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim treeList As ASPxTreeList = TryCast(sender, ASPxTreeList)
		Dim keyValue As Object = ASPxGridView.GetDetailRowValues(treeList, "EmployeeID")
		If keyValue.Equals(2) OrElse keyValue.Equals(5) Then
			treeList.RootValue = keyValue
		End If
	End Sub

	Protected Sub detailGrid_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
		Session("CustomerID") = ASPxGridView.GetDetailRowValues(grid, "CustomerID")
	End Sub

	Protected Sub GridView1_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridView As GridView = TryCast(sender, GridView)
		gridView.DataSource = dsDetailView
		dsDetailView.SelectParameters("EmployeeID").DefaultValue = ASPxGridView.GetDetailRowValues(gridView, "EmployeeID").ToString()
	End Sub
End Class
