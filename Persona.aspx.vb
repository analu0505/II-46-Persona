Imports Persona.Models
Imports Persona.Utils

Public Class Persona
    Inherits System.Web.UI.Page
    Private db As New dbPersona()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Dim persona As New Models.Persona()

        'Validar campos obligatorios 
        If txtFechaNac.Text = "" Then
            lblMensaje.Text = "Por favor, complete todos los campos obligatorios."
            Return
        End If

        persona.Nombre = txtNombre.Text.Trim()
        persona.Apellidos = txtApellido.Text.Trim()
        persona.FechaNacimiento = txtFechaNac.Text.Trim()
        persona.Correo = txtCorreo.Text.Trim()
        persona.TipoDocumento = ddlTipoDocumento.SelectedItem.Value
        persona.NumeroDocumento = txtNumeroDoc.Text.Trim()
        lblMensaje.Text = persona.Resumen()
        Dim errorMessage As String = ""
        Dim resultado = db.CrearPersona(persona, errorMessage)

        If resultado Then
            SwalUtils.ShowSwal(Me, "Persona creada exitosamente.")
            gvPersonas.DataBind()
            LimpiarFormulario()
        Else
            SwalUtils.ShowSwalError(Me, errorMessage)
        End If

    End Sub

    Protected Sub gvPersonas_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        e.Cancel = True ' Cancelar la eliminación predeterminada del GridView
        Dim id As Integer = Convert.ToInt32(gvPersonas.DataKeys(e.RowIndex).Value)
        Dim errorMessage As String = ""
        Dim resultado = db.EliminarPersona(id, errorMessage)
        If resultado Then
            SwalUtils.ShowSwal(Me, "Persona eliminada exitosamente.")
            gvPersonas.DataBind() ' Refrescar el GridView después de eliminar
        Else
            SwalUtils.ShowSwalError(Me, errorMessage)
        End If
    End Sub

    Protected Sub gvPersonas_RowEditing(sender As Object, e As GridViewEditEventArgs)

    End Sub

    Protected Sub gvPersonas_SelectedIndexChanged(sender As Object, e As EventArgs)
        hfIdPersona.Value = gvPersonas.DataKeys(gvPersonas.SelectedIndex).Value
        Dim id As Integer = Convert.ToInt32(hfIdPersona.Value)


        Dim errorMessage As String = ""
        Dim p As Models.Persona = db.ConsultarPersona(id, errorMessage)


        If p Is Nothing Then
            SwalUtils.ShowSwalError(Me, If(errorMessage = "", "No se pudo cargar la persona.", errorMessage))
            Return
        End If


        txtNumeroDoc.Text = p.NumeroDocumento
        txtNombre.Text = p.Nombre
        txtApellido.Text = p.Apellidos
        ddlTipoDocumento.SelectedValue = p.TipoDocumento
        txtCorreo.Text = p.Correo
        txtFechaNac.Text = DateTime.Parse(p.FechaNacimiento).ToString("yyyy-MM-dd")
        btnGuardar.Visible = False
        btnActualizar.Visible = True
        btnCancelar.Visible = True

    End Sub


    Protected Sub gvPersonas_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)

    End Sub

    Protected Sub gvPersonas_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)

    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs)
        LimpiarFormulario()
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)
        btnGuardar.Visible = False
        btnActualizar.Visible = True
        btnCancelar.Visible = False
        LimpiarFormulario()
    End Sub

    Protected Sub LimpiarFormulario()
        txtNumeroDoc.Text = ""
        txtNombre.Text = ""
        txtApellido.Text = ""
        ddlTipoDocumento.SelectedIndex = 0
        txtCorreo.Text = ""
        txtFechaNac.Text = ""
    End Sub

End Class