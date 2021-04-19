using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UTTT.Ejemplo.Linq.Data.Entity
{
    public partial class Persona
    {
        private string NomCompleto;
        public string NombreCompleto

        {
            get => this.strNombre + " " + this.strAPaterno + "" + ((this.strAMaterno !=null) ? this.strAMaterno : String.Empty);
            set => NomCompleto = value;
        }
    }
}
