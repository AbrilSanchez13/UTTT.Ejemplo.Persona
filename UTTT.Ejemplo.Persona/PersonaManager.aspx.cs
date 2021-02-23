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
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Configuration;
#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Persona baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idPersona = this.session.Parametros["idPersona"] != null ?
                    int.Parse(this.session.Parametros["idPersona"].ToString()) : 0;
                if (this.idPersona == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Persona();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Persona>().First(c => c.id == this.idPersona);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList();

                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "id";

                    //List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList();
                    //CatSexo catTemp = new CatSexo();
                    //catTemp.id = -1;
                    //catTemp.strValor = "Seleccionar";
                    //lista.Insert(0, catTemp);
                    //this.ddlSexo.DataTextField = "strValor";
                    //this.ddlSexo.DataValueField = "id";
                    //this.ddlSexo.DataSource = lista;
                    //this.ddlSexo.DataBind();

                    //this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    //this.ddlSexo.AutoPostBack = true;

                    if (this.idPersona == 0)
                    {
                        CatSexo catTemp = new CatSexo();
                        catTemp.id = -1;
                        catTemp.strValor = "Seleccionar";
                        lista.Insert(0, catTemp);
                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();

                        this.lblAccion.Text = "Agregar";
                        DateTime tiempo = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                        this.dteCalendar.TodaysDate = tiempo;
                        this.dteCalendar.SelectedDate = tiempo;
                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombre;
                        this.txtAPaterno.Text = this.baseEntity.strAPaterno;
                        this.txtAMaterno.Text = this.baseEntity.strAMaterno;
                        this.txtClaveUnica.Text = this.baseEntity.strClaveUnica;
                        this.txtNumHermanos.Text = this.baseEntity.intNumHermanos.ToString();
                        this.txtEmail.Text = this.baseEntity.strEmail;
                        this.txtCodigoPostal.Text = this.baseEntity.strCodigoPostal;
                        this.txtRfc.Text = this.baseEntity.strRfc;
                        DateTime? fechaNacimiento = this.baseEntity.dteFechaNacimiento;
                        if (fechaNacimiento != null)
                        {
                            this.dteCalendar.TodaysDate = (DateTime)fechaNacimiento;
                            this.dteCalendar.SelectedDate = (DateTime)fechaNacimiento;
                        }
                        this.ddlSexo.DataSource = lista;
                        this.ddlSexo.DataBind();
                        this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);
                    }
                    this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    this.ddlSexo.AutoPostBack = true;
                }

            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                if (this.idPersona == 0)
                {
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.intNumHermanos = !this.txtNumHermanos.Text.Equals(String.Empty) ?
                        int.Parse(this.txtNumHermanos.Text) : 0;
                    persona.strEmail = this.txtEmail.Text.Trim();
                    persona.strCodigoPostal = this.txtCodigoPostal.Text.Trim();
                    persona.strRfc = this.txtRfc.Text.Trim();

                    DateTime fechaNacimiento = this.dteCalendar.SelectedDate.Date;
                    persona.dteFechaNacimiento = fechaNacimiento;



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

                    if (!this.validacion(persona, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    

                    dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().InsertOnSubmit(persona);
                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se agrego correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);

                }
                if (this.idPersona > 0)
                {
                    persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.id == idPersona);
                    persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                    persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                    persona.strNombre = this.txtNombre.Text.Trim();
                    persona.strAMaterno = this.txtAMaterno.Text.Trim();
                    persona.strAPaterno = this.txtAPaterno.Text.Trim();
                    persona.intNumHermanos = int.Parse(this.txtNumHermanos.Text);
                    persona.strEmail = this.txtEmail.Text.Trim();
                    persona.strCodigoPostal = this.txtCodigoPostal.Text.Trim();
                    persona.strRfc = this.txtRfc.Text.Trim();
                    DateTime fechaNacimiento = this.dteCalendar.SelectedDate.Date;
                    persona.dteFechaNacimiento = fechaNacimiento;

                    dcGuardar.SubmitChanges();
                    this.showMessage("El   registro se edito correctamente.");
                    this.Response.Redirect("~/PersonaPrincipal.aspx", false);
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
                // this.showMessageException(_e.Message);
                Response.Redirect("~/ErrorPage.aspx", false);

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        protected void ddlSexo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idSexo = int.Parse(this.ddlSexo.Text);
                Expression<Func<CatSexo, bool>> predicateSexo = c => c.id == idSexo;
                predicateSexo.Compile();
                List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().Where(predicateSexo).ToList();
                CatSexo catTemp = new CatSexo();
                this.ddlSexo.DataTextField = "strValor";
                this.ddlSexo.DataValueField = "id";
                this.ddlSexo.DataSource = lista;
                this.ddlSexo.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
        protected void dteCalendar_SelectionChanged(object sender, EventArgs e)
        {

            hide.Value = dteCalendar.SelectedDate.ToString();
        }
        #endregion

        #region Metodos

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
        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Persona _persona, ref String _mensaje)
        {

            if (_persona.idCatSexo == -1)
            {
                _mensaje = "Selecciona el sexo";
                return false;
            }
            if (_persona.strClaveUnica.Equals(String.Empty))
            {
                _mensaje = "El campo de clave unica no puede estar vacio";
                return false;
            }
            int i = 0;
            if (int.TryParse(_persona.strClaveUnica, out i) == false)
            {
                _mensaje = "En clave unica solo acepta numeros";
                return false;

            }//la clave es de 3 numeros asi que no puede ser 99 pero puede ser 000
            if (int.Parse(_persona.strClaveUnica) < 100 || int.Parse(_persona.strClaveUnica) > 999)
            {
                _mensaje = "La clave unica debe tener 3 numeros";
                return false;
            }
            if (_persona.strNombre.Equals(String.Empty))
            {
                _mensaje = "El campo nombre no puede estar vacio";
                return false;
            }
            if (_persona.strNombre.Length > 15)
            {
                _mensaje = "El nombre no acepta mas de 15 caracteres";
                return false;
            }
            if (_persona.strAPaterno.Equals(String.Empty))
            {
                _mensaje = "El A Paterno esta vacio";
                return false;
            }
            if (_persona.strAPaterno.Length > 15)
            {
                _mensaje = "Los caracteres permitidos para A Paterno rebasan lo establecido 15 caracteres";
                return false;
            }
            if (_persona.strAMaterno.Equals(String.Empty))
            {
                _mensaje = "El A Materno esta vacio";
                return false;
            }
            if (_persona.strAMaterno.Length > 15)
            {
                _mensaje = "Los caracteres permitidos para A Materno rebasan lo establecido 15 caracteres";
                return false;
            }
            if (int.TryParse(_persona.intNumHermanos.ToString(), out i) == false)
            {
                _mensaje = "El numero de hermanos debe ser numeros";
                return false;
            }
            if (_persona.intNumHermanos < 0 || _persona.intNumHermanos > 20)
            {
                _mensaje = "El numero de hermanos no debe ser menor a cero";
                return false;
            }

            if (_persona.strEmail.Equals(String.Empty))
            {
                _mensaje = "Correo esta vacio";
                return false;
            }
            if (_persona.strEmail.Length > 50)
            {
                _mensaje = "Los caracteres permitidos para Correo rebasan lo establecido 50 caracteres";
                return false;
            }
            if (_persona.strCodigoPostal.Equals(String.Empty))
            {
                _mensaje = "Codigo Postal esta vacio";
                return false;
            }
            if (int.TryParse(_persona.strCodigoPostal, out i) == false)
            {
                _mensaje = "El codigo postal solo debe ser numeros: ejemplo 42860";
                return false;
            }

            if (int.Parse(_persona.strCodigoPostal) < 0000 || int.Parse(_persona.strCodigoPostal) > 99999)
            {
                _mensaje = "El codigo postal debe constar de 5 numeros";
                return false;
            }
            if (_persona.strRfc.Equals(String.Empty))
            {
                _mensaje = "El RFC esta vacio";
                return false;
            }
            if (_persona.strRfc.Length > 50)
            {
                _mensaje = "Los caracteres permitidos para RFC rebasan lo establecido";
                return false;
            }


            DateTime? fecha = this.baseEntity.dteFechaNacimiento;
            this.hide.Value = fecha.ToString();
            TimeSpan timeSpan = DateTime.Now - _persona.dteFechaNacimiento.Value.Date;
            if (timeSpan.Days < 6570)
            {
                _mensaje = "La persona debe ser mayor de 18 años";
                return false;
            }
            return true;
        }

        private bool validaSql(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajeFuncion = string.Empty;
            if (valida.sqlInyectionValida(this.txtClaveUnica.Text.Trim(), ref mensajeFuncion, "Clave Unica", ref this.txtClaveUnica))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtNombre.Text.Trim(), ref mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtAPaterno.Text.Trim(), ref mensajeFuncion, "A Paterno", ref this.txtAPaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            
            }
            if (valida.sqlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensajeFuncion, "A Materno", ref this.txtAMaterno))
            {
                _mensaje = mensajeFuncion;
                return false;

            }
            if (valida.sqlInyectionValida(this.txtNumHermanos.Text.Trim(), ref mensajeFuncion, "Numero Hermanos", ref this.txtNumHermanos))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtEmail.Text.Trim(), ref mensajeFuncion, "Email", ref this.txtEmail))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtCodigoPostal.Text.Trim(), ref mensajeFuncion, "Codigo Postal", ref this.txtCodigoPostal))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtRfc.Text.Trim(), ref mensajeFuncion, "RFC", ref this.txtRfc))
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
            if(valida.htmlInyectionValida(this.txtClaveUnica.Text.Trim(), ref mensajeFuncion, "Clave Unica", ref this.txtClaveUnica))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtNombre.Text.Trim(), ref mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAPaterno.Text.Trim(), ref mensajeFuncion, "A Paterno", ref this.txtAPaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensajeFuncion, "A Materno", ref this.txtAMaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtNumHermanos.Text.Trim(), ref mensajeFuncion, "Numero Hermanos", ref this.txtNumHermanos))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtEmail.Text.Trim(), ref mensajeFuncion, "Correo", ref this.txtEmail))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtCodigoPostal.Text.Trim(), ref mensajeFuncion, "Codigo Postal", ref this.txtCodigoPostal))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
       
            if (valida.htmlInyectionValida(this.txtRfc.Text.Trim(), ref mensajeFuncion, "RFC", ref this.txtRfc))
            {
            _mensaje = mensajeFuncion;
            return false;
        }
            return true;
        }
    }
    #endregion
}

