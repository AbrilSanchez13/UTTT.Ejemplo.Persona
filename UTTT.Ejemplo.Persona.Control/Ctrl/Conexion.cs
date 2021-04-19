using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace UTTT.Ejemplo.Persona.Control.Ctrl
{
    public class Conexion
    {
        #region Variables
     
        #endregion

        #region Constructores
        public Conexion()
        {
        }       
        #endregion


        public SqlConnection sqlConnection()
        {
            try
            {
                SqlConnection conexion = new SqlConnection("Data Source=SQL5104.site4now.net;Initial Catalog=db_a71afc_abrilsanchez;User Id=db_a71afc_abrilsanchez_admin;Password=1KERbadill0");
                return conexion;

            }
            catch (Exception _e)
            { 
            
            }
            return null;
        }
    }
}
