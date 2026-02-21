<%@ Page Title="Persona" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Persona.aspx.vb" Inherits="Persona.Persona" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--Nombre--%>
    <div class="form-group">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre completo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" Text="Ana" placeholder="Nombre Completo" CssClass="form-control"></asp:TextBox>
    </div>
    <%--apellido--%>
    <div class="form-group">
        <asp:Label ID="lblApellido" runat="server" Text="Apellido:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtApellido" runat="server" Text="Carvajal" placeholder="Apellidos" CssClass="form-control"></asp:TextBox>
    </div>
    <%--fecha nacimiento--%>
    <div class="form-group">
        <asp:Label ID="lblFechaNac" runat="server" Text="Nombre completo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtFechaNac" runat="server" placeholder="01/01/2026" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>
    <%--validar fecha de nacimiento--%>
    <asp:RequiredFieldValidator ID="rfvFecha" runat="server" 
        CssClass="text-danger"
        ControlToValidate="txtFechaNac"
        ErrorMessage="Es necesarioindicar la fecha "></asp:RequiredFieldValidator>
    <%--correo--%>
    <div class="form-group">
        <asp:Label ID="lblCorreo" runat="server" Text="Correo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtCorreo" runat="server" placeholder="Correo Electronico" CssClass="form-control" TextMode="Email"></asp:TextBox>
    </div>
    <%--Tipo Documento--%>
    <div class="form-group">
        <asp:Label ID="lblTipoDoc" runat="server" Text="Tipo Documento:" CssClass="control-label"></asp:Label>
        <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="form-control">
            <asp:ListItem Text="Cedula Juridica" Value="0"></asp:ListItem>
            <asp:ListItem Text="Cedula Fisica" Value="1"></asp:ListItem>
            <asp:ListItem Text="Pasaporte" Value="2"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <%--numero documento--%>
    <div class="form-group">
        <asp:Label ID="lblNumeroDoc" runat="server" Text="Numero Documento" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNumeroDoc" runat="server" placeholder="Numero Documento" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="py-3">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
    </div>
    <asp:Label ID="lblMensaje" runat="server" Text="Mensaje:" CssClass="dnone"></asp:Label>
</asp:Content>
