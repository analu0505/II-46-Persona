Imports System.Data.SqlClient

Public Class DbHelper
    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("II-46_PROGRAIIIConnectionString").ConnectionString

    Public Function Getconexion() As SqlConnection
        Return New SqlConnection(connectionString)

    End Function

    Public Function CrearPersona(persona As Models.Persona) As Integer
        Dim Sql As String = "
        INSERT INTO Personas(Nombre, Apellidos, Fecha_Nacimiento, Correo, Numero_Documento, Tipo_Documento)" &
        "VALUES(@Nombre, @Apellidos, @Fecha_Nacimiento, @Correo, @Numero_Documento, @Tipo_Documento); " &
        "SELECT SCOPE_IDENTITY();"



        'CONEXION A LA BASE DE DATOS
        Using conn As SqlConnection = Getconexion()
            Using cmd As New SqlCommand(Sql, conn)
                conn.Open()
                cmd.Parameters.AddWithValue("@Nombre", persona.Nombre)
                cmd.Parameters.AddWithValue("@Apellidos", persona.Apellidos)
                cmd.Parameters.AddWithValue("@Correo", persona.Correo)
                cmd.Parameters.AddWithValue("@Fecha_Nacimiento", persona.FechaNacimiento)
                cmd.Parameters.AddWithValue("@Numero_Documento", persona.NumeroDocumento)
                cmd.Parameters.AddWithValue("@Tipo_Documento", persona.TipoDocumento)

                'Return cmd.ExecuteNonQuery() Devolver la cantidad de lineas insertadas
                Return Convert.ToInt32(cmd.ExecuteScalar())
            End Using
        End Using
        Return 0
    End Function
End Class
