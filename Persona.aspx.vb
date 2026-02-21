Public Class Persona
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Dim persona = New Models.Persona()
        'Validar fecha desde el codebehind
        'tiene prioridad la validación del aspx sobre la del codebehind
        If IsDate(txtFechaNac.Text) = False Then
            lblMensaje.Text = "La fecha de nacimiento no es válida"
            Return
        End If

        persona.Nombre = txtNombre.Text
        persona.Apellidos = txtApellido.Text
        persona.FechaNacimiento = txtFechaNac.Text
        persona.Correo = txtCorreo.Text
        persona.TipoDocumento = ddlTipoDocumento.SelectedItem.Text
        persona.NumeroDocumento = txtNumeroDoc.Text
        lblMensaje.Text = persona.Resumen()
    End Sub
End Class