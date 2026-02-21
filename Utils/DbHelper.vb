Imports System.Data.SqlClient

Public Class DbHelper
    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("II-46_PROGRAIIIConnectionString").ConnectionString

    Public Function Getconexion() As SqlConnection
        Return New SqlConnection(connectionString)

    End Function

    Public Function CrearPersona() As Integer
        Dim Sql As String = "INSERT INTO Personas(Nombre, Apellidos, Fecha_Nacimiento, Correo, Numero_Documento, Tipo_Documento )
        VALUES( @Nombre, @Apellidos, @Fecha_Nacimiento, @Correo, @Numero_Documento, @Tipo_Documento)"
        'CONEXION A LA BASE DE DATOS
        Using conn As SqlConnection = Getconexion()
            Using cmd As New SqlCommand(Sql, conn)
                conn.Open()
                Return cmd.ExecuteNonQuery()
            End Using
        End Using
        Return 0
    End Function
End Class
