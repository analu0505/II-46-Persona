<%@ Page Title="Persona" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Persona.aspx.vb" Inherits="Persona.Persona" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--Nombre--%>
    <div class="form-group">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre completo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" Text="Ana" placeholder="Nombre Completo" CssClass="form-control"></asp:TextBox>
    </div>
        <%--Validar nombre--%>
        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="txtNombre"
        ErrorMessage="Es necesario indicar el nombre "></asp:RequiredFieldValidator>

    <%--apellido--%>
    <div class="form-group">
        <asp:Label ID="lblApellido" runat="server" Text="Apellido:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtApellido" runat="server" Text="Carvajal" placeholder="Apellidos" CssClass="form-control"></asp:TextBox>
    </div>
    <%--Validar apellido--%>
        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" 
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="txtApellido"
        ErrorMessage="Es necesario indicar el apellido "></asp:RequiredFieldValidator>

    <%--fecha nacimiento--%>
    <div class="form-group">
        <asp:Label ID="lblFechaNac" runat="server" Text="Nombre completo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtFechaNac" runat="server" placeholder="01/01/2026" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>
    <%--validar fecha de nacimiento--%>
    <asp:RequiredFieldValidator ID="rfvFecha" runat="server" 
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="txtFechaNac"
        ErrorMessage="Es necesario indicar la fecha "></asp:RequiredFieldValidator>

    <%--correo--%>
    <div class="form-group">
        <asp:Label ID="lblCorreo" runat="server" Text="Correo:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtCorreo" runat="server" placeholder="Correo Electronico" CssClass="form-control" TextMode="Email"></asp:TextBox>
    </div>
        <%--Validar correo--%>
        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" 
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="txtCorreo"
        ErrorMessage="Es necesario indicar el correo "></asp:RequiredFieldValidator>

    <%--Tipo Documento--%>
    <div class="form-group">
        <asp:Label ID="lblTipoDoc" runat="server" Text="Tipo Documento:" CssClass="control-label"></asp:Label>
        <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="form-control">
            <asp:ListItem Text="Cedula Juridica" Value="0"></asp:ListItem>
            <asp:ListItem Text="Cedula Fisica" Value="1"></asp:ListItem>
            <asp:ListItem Text="Pasaporte" Value="2"></asp:ListItem>
        </asp:DropDownList>
    </div>
        <%--Validar Tipo Documento--%>
        <asp:RequiredFieldValidator ID="rfvTipoDoc" runat="server" 
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="lblTipoDoc"
        ErrorMessage="Es necesario indicar el tipo de Documento "></asp:RequiredFieldValidator>

    <%--numero documento--%>
    <div class="form-group">
        <asp:Label ID="lblNumeroDoc" runat="server" Text="Numero Documento" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNumeroDoc" runat="server" placeholder="Numero Documento" CssClass="form-control"></asp:TextBox>
    </div>
        <%--Validar numero de documento--%>
        <asp:RequiredFieldValidator ID="rfvNumeroDoc" runat="server" 
        CssClass="text-danger"
        Display="Dynamic"
        ControlToValidate="txtNumeroDoc"
        ErrorMessage="Es necesario indicar el numero de documento "></asp:RequiredFieldValidator>

    <div class="py-3">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
    </div>
    <asp:Label ID="lblMensaje" runat="server" Text="Mensaje:" CssClass="dnone"></asp:Label>

    <asp:GridView ID="gvPersonas" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Persona" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id_Persona" HeaderText="Id_Persona" InsertVisible="False" ReadOnly="True" SortExpression="Id_Persona" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="Fecha_Nacimiento" HeaderText="Fecha_Nacimiento" SortExpression="Fecha_Nacimiento" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
            <asp:BoundField DataField="Numero_Documento" HeaderText="Numero_Documento" SortExpression="Numero_Documento" />
            <asp:BoundField DataField="Tipo_Documento" HeaderText="Tipo_Documento" SortExpression="Tipo_Documento" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:II-46_PROGRAIIIConnectionString %>" ProviderName="<%$ ConnectionStrings:II-46_PROGRAIIIConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Personas] ORDER BY [Apellidos]"></asp:SqlDataSource>

</asp:Content>
