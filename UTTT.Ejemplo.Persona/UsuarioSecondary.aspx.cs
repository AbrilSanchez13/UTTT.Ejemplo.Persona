using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioSecondary : System.Web.UI.Page
    {

        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuarios baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                    int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;
                if (this.idUsuario == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Usuarios();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuarios>().First(c => c.id == this.idUsuario);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<CatEdo> listaEdo = dcGlobal.GetTable<CatEdo>().ToList();
                    this.ddlEdo.DataTextField = "strEdo";
                    this.ddlEdo.DataValueField = "id";

                    List<UTTT.Ejemplo.Linq.Data.Entity.Persona> personaLista = dcGlobal.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().ToList();
                    this.ddlPersona.DataTextField = "NombreCompleto";
                    this.ddlEdo.DataValueField = "id";



                    if (this.idUsuario == 0)
                    {
                       
                        this.ddlPersona.DataSource = personaLista;
                        this.ddlPersona.DataBind();
                        
                        CatEdo catTemp = new CatEdo();
                        catTemp.id = -1;
                        catTemp.strEdo = "Activo";
                        listaEdo.Insert(1, catTemp);
                        this.ddlEdo.DataSource = listaEdo;
                        this.ddlEdo.DataBind();

                        this.lblAccion.Text = "Agregar";
                        DateTime tiempo = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                        this.dteCalendar2.TodaysDate = tiempo;
                        this.dteCalendar2.SelectedDate = tiempo;
                    }
                    else //editar
                    {

                        this.lblAccion.Text = "Editar";
                        this.txtNombreUsuario.Text = this.baseEntity.strNomUser;
                        this.txtContraseña.Text = this.baseEntity.strContraseña;
                        this.txtConfirmarContraseña.Text = this.baseEntity.strRepContraseña;
                       
                        DateTime? fechaIngreso = this.baseEntity.dteFechaIngreso;
                        this.hide.Value = fechaIngreso.ToString();

                        if (fechaIngreso != null)
                        {
                            this.dteCalendar2.TodaysDate = (DateTime)fechaIngreso;
                            this.dteCalendar2.SelectedDate = (DateTime)fechaIngreso;
                        }
                        this.ddlEdo.DataSource = listaEdo;
                        this.ddlEdo.DataBind();
                        this.setItem(ref this.ddlEdo, baseEntity.CatEdo.strEdo);

                       
                    }
                    this.ddlEdo.SelectedIndexChanged += new EventHandler(ddlEdo_SelectedIndexChanged);
                    this.ddlEdo.AutoPostBack = true;

                }
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/Usuarios.aspx", false);
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    return;
                }

                {
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuarios usuarios = new Linq.Data.Entity.Usuarios();
                    if (this.idUsuario == 0)
                    {
                        //usuarios.idPersona = int.Parse(this.ddlPersona.Text);
                    
                        usuarios.strNomUser = this.txtNombreUsuario.Text.Trim();
                        usuarios.strContraseña = this.txtContraseña.Text.Trim();
                        usuarios.strRepContraseña = this.txtConfirmarContraseña.Text.Trim();
                      usuarios.idCatEdo = int.Parse(this.ddlEdo.Text);
                        DateTime fechaIngreso = this.dteCalendar2.SelectedDate.Date;
                        usuarios.dteFechaIngreso = fechaIngreso;

                        String mensaje = String.Empty;
                        if (!this.validaHTML(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        if (!this.validaSql(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }

                        if (!this.validacion(usuarios, ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }


                        dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().InsertOnSubmit(usuarios);
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se agrego correctamente.");
                        this.Response.Redirect("~/Usuarios.aspx", false);

                    }
                
                    if (this.idUsuario > 0) //editar
                    {
                        usuarios = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuarios>().First(c => c.id == idUsuario);
                        usuarios.idPersona = int.Parse(this.ddlPersona.Text);
                        usuarios.strNomUser = this.txtNombreUsuario.Text.Trim();
                        usuarios.strContraseña = this.txtContraseña.Text.Trim();
                        usuarios.strRepContraseña = this.txtConfirmarContraseña.Text.Trim();
                        usuarios.idCatEdo = int.Parse(this.ddlEdo.Text);

                        DateTime fechaIngreso = this.dteCalendar2.SelectedDate.Date;
                        usuarios.dteFechaIngreso = fechaIngreso;
                      

                        String mensaje = String.Empty;
                        if (!this.validaHTML(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        if (!this.validaSql(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }

                        if (!this.validacion(usuarios, ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se edito correctamente");
                        this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                    }
                }
            }

            catch (Exception _e)
            {
                //Manejo envió de correos electrónicos al ocurrir una excepción y se enviara los datos de la excepción
                var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
                string strHost = smtpSection.Network.Host;
                int port = smtpSection.Network.Port;
                string strUserName = smtpSection.Network.UserName;
                string strFromPass = smtpSection.Network.Password;
                SmtpClient smtp = new SmtpClient(strHost, port);
                MailMessage msg = new MailMessage();
                string body = "<h1>Error Identificado: " + _e.Message + "</h1>";
                msg.From = new MailAddress(smtpSection.From, "Correo para Errores");
                msg.To.Add(new MailAddress("18300619@uttt.edu.mx"));
                msg.Subject = "Ha ocurrido un error"; ;
                msg.IsBodyHtml = true;
                msg.Body = body;

                smtp.Credentials = new NetworkCredential(strUserName, strFromPass);
                smtp.EnableSsl = true;
                smtp.Send(msg);
                this.showMessageException(_e.Message);
                Response.Redirect("~/ErrorPage.aspx", false);

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/Usuarios.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        public void setItem(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value == _value)
                {
                    item.Selected = true;
                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }
        protected void ddlEdo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idEdo = int.Parse(this.ddlEdo.Text);
                Expression<Func<CatEdo, bool>> predicateEdo = c => c.id == idEdo;
                predicateEdo.Compile();
                List<CatEdo> lista = dcGlobal.GetTable<CatEdo>().Where(predicateEdo).ToList();
                CatSexo catTemp = new CatSexo();
                this.ddlEdo.DataTextField = "strEdo";
                this.ddlEdo.DataValueField = "id";
                this.ddlEdo.DataSource = lista;
                this.ddlEdo.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
        protected void dteCalendar2_SelectionChanged(object sender, EventArgs e)
        {
            //txtFecha.Text = dteCalendar.SelectedDate.ToString();
            //   txtFechaNacimiento.Text = dteCalendar.SelectedDate.ToString();
            hide.Value = dteCalendar2.SelectedDate.ToString();
        }

        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Usuarios _usuarios, ref String _mensaje)
        {
            //if (_usuarios.ddlPersona == -1)
            //{
            //    _mensaje = "Selecciona la Persona";
            //    return false;
            //}
            if (_usuarios.strNomUser.Equals(String.Empty))
            {
                _mensaje = "El campo de Nombre de Usuario no puede estar vacio";
                return false;
            }
 
            if (_usuarios.strContraseña.Equals(String.Empty))
            {
                _mensaje = "El campo Contraseña no puede estar vacio";
                return false;
            }
            if (_usuarios.strContraseña.Length > 15)
            {
                _mensaje = "La contraseña no acepta mas de 15 caracteres";
                return false;
            }
            if (_usuarios.strRepContraseña.Equals(String.Empty))
            {
                _mensaje = "El campo Confirmar contraseña no puede estar vacio";
                return false;
            }
        
            if (_usuarios.strRepContraseña.Length > 15)
            {
                _mensaje = "Confirmar Contraseña no acepta mas de 155 caracteres";
                return false;
            }
            //if (_usuarios.idCatEdo == -1)
            //{
            //    _mensaje = "Selecciona el Estado";
            //    return false;
            //}
            return true;
        }

        private bool validaSql(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajeFuncion = string.Empty;
            if (valida.sqlInyectionValida(this.txtNombreUsuario.Text.Trim(), ref mensajeFuncion, "Nombre de Usuario", ref this.txtNombreUsuario))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtContraseña.Text.Trim(), ref mensajeFuncion, "Contraseña", ref this.txtContraseña))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtConfirmarContraseña.Text.Trim(), ref mensajeFuncion, "Confirmar Contraseña", ref this.txtConfirmarContraseña))
            {
                _mensaje = mensajeFuncion;
                return false;

            }
            return true;
        }
        private bool validaHTML(ref String _mensaje)

        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajeFuncion = string.Empty;
            if (valida.htmlInyectionValida(this.txtNombreUsuario.Text.Trim(), ref mensajeFuncion, "Nombre de Usuario", ref this.txtNombreUsuario))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtContraseña.Text.Trim(), ref mensajeFuncion, "Contraseña", ref this.txtContraseña))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtConfirmarContraseña.Text.Trim(), ref mensajeFuncion, "Confirmar Contraseña", ref this.txtConfirmarContraseña))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            return true;
        }

    }
}