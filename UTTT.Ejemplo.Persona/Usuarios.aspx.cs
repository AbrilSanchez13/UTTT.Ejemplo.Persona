#region Using
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class Usuarios : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.Buffer = true;
                DataContext dcTemp = new DcGeneralDataContext();
                if (!this.IsPostBack)
                {
                    List<CatEdo> lista = dcTemp.GetTable<CatEdo>().ToList();
                    CatEdo catTemp = new CatEdo();
                    catTemp.id = -1;
                    catTemp.strEdo = "Todos";
                    lista.Insert(0, catTemp);
                    this.ddlEdo.DataTextField = "strEdo";
                    this.ddlEdo.DataValueField = "id";
                    this.ddlEdo.DataSource = lista;
                    this.ddlEdo.DataBind();
                }
            }

            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                this.DataSourceUsuarios.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al buscar");
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                this.session.Pantalla = "~/UsuarioSecondary.aspx";
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idUsuarios", "0");
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al agregar");
            }
        }

        protected void DataSourceUsuarios_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            try
            {
                DataContext dcConsulta = new DcGeneralDataContext();
                bool nombreUseBool = false;

                bool estadoBool = false;

                if (!this.txtNombreUsuario.Text.Equals(String.Empty))
                {
                    nombreUseBool = true;
                }
                if (this.ddlEdo.Text != "-1")
                {
                    estadoBool = true;
                }

                Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Usuarios, bool>>
                    predicate =
                    (c =>
                    ((estadoBool) ? c.idCatEdo == int.Parse(this.ddlEdo.Text) : true) &&
                    ((nombreUseBool) ? (((nombreUseBool) ? c.strNomUser.Contains(this.txtNombreUsuario.Text.Trim()) : false)) : true)
                    );


                predicate.Compile();

                List<UTTT.Ejemplo.Linq.Data.Entity.Usuarios> listaUsuarios =
                    dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().Where(predicate).ToList();
                e.Result = listaUsuarios;
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void dgvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idUsuarios = int.Parse(e.CommandArgument.ToString());
                switch (e.CommandName)
                {
                    case "Editar":
                        this.editar(idUsuarios);
                        break; 
                    case "Eliminar":
                        this.eliminar(idUsuarios);
                        break;
                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al seleccionar");
            }
        }
        #region Metodos

        private void editar(int _idUsuarios)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idUsuarios", _idUsuarios.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/UsuarioSecondary.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
               }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        private void eliminar(int _idUsuarios)
        {
            try
            {
                DataContext dcDelete = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Usuarios usuario = dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().First(
                    c => c.id == _idUsuarios);
                dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().DeleteOnSubmit(usuario);
                dcDelete.SubmitChanges();
                this.showMessage("El registro se elimino correctamente.");
                this.DataSourceUsuarios.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

    }
    #endregion
}
