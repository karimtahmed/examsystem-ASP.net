<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string strSelect= " ";
        // Authenticating the user

        // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|online_examination.mdf;Integrated Security=True";

        if (portal.SelectedValue == "Student")
        {
            // 2- Create Sql Select statement string
            strSelect = "SELECT * FROM Student "
               + " WHERE SID = '" + txtUsername.Text + "' AND "
               + " Password = '" + txtPassword.Text + "'";
        }

        else if (portal.SelectedValue == "Admin")
        {
            // 2- Create Sql Select statement string
            strSelect = "SELECT * FROM Admin "
               + " WHERE AID = '" + txtUsername.Text + "' AND "
               + " Password = '" + txtPassword.Text + "'";
        }

        else if (portal.SelectedValue == "Teacher")
        {
            // 2- Create Sql Select statement string
            strSelect = "SELECT * FROM Teacher "
               + " WHERE TID = '" + txtUsername.Text + "' AND "
               + " Password = '" + txtPassword.Text + "'";
        }
        // 3- Create Sql command
        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        // 4- Create Sql Data Reader
        SqlDataReader reader;

        // 5- Open the databse
        conn.Open();

        // 6- Execute Sql command
        reader = cmdSelect.ExecuteReader();

        // 7- Check reader
        if (reader.Read())
        {

            if (portal.SelectedValue == "Student")
            {
                 string Fname = (string)reader.GetValue(0);
            string Lname = (string)reader.GetValue(1);

            HttpCookie coco = new HttpCookie("userInfo");
            coco.Values.Add("SID", txtUsername.Text);
            coco.Values.Add("passw", txtPassword.Text);

             coco.Values.Add("Fn", Fname);
             coco.Values.Add("Ln", Lname);

            coco.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(coco);

                Response.Redirect("~/ccode.aspx");
            }
           else if (portal.SelectedValue == "Admin")
            Response.Redirect("~/index.html");
        }
        else
            lblMsg.Text = "Invalid Username and/or Password, you may try again!!";

        // 8- Close the database
        conn.Close();

    }

</script>
   

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            height: 34px;
        }
        .style4
        {
            height: 34px;
        }
        .style5
        {
            width: 96px;
        }
        .style6
        {
            height: 34px;
            width: 96px;
        }
        body { margin: 0; 

        }          canvas { width: 100%; height: 100

          }
        .auto-style2 {
            height: 32px;
        }
         .container {
  padding: 16px;
      max-width: 330px;
}
         .form-signin {
    width: 100%;
    padding: 15px;
    margin: auto;
}
        .l {
                font-weight: 400!important;
                margin-bottom: 1rem!important;
                font-size: calc(1.3rem + .6vw)!important;
                margin-top: 0!important;
                padding-top: 0!important;
                line-height: 1.2!important;
                box-sizing: border-box!important;
                display: block!important;
                margin-block-start: 0.67em!important;
                margin-block-end: 0.67em!important;
                margin-inline-start: 0px!important;
                margin-inline-end: 0px!important;
                text-align: center!important;

        }
        .w-100 {
    width: 100%!important;
}
        .auto-style4 {
            height: 33px;
        }
        .form-floating {
    position: relative;
   
    
}
        .mb-4, .my-4 {
    margin-bottom: -2.5rem!important;
    margin-left: 33px!important;
}
        .btn-primary {
    border-color: #50A4AC!important;
    background-color: #50A4AC!important;
    color: #fff;
}
.btn-primary:hover {
  background-color: #3f3a64!important;
  border-color: #3f3a64!important;
}
 .btn-secondary {
            color:white !important;
            background-color:white;
            background-color:  #50A4AC;
        }
        .btn-secondary:hover {
            color:white !important;
            background-color: #3f3a64; 
            }
    </style>
</head>
<body style="align-items: center!important; background-color: #f5f5f5;">
    <div class="container shadow p-3 mb-5 bg-body rounded border border-5" style="border-radius:5px; margin-top:30px;">
    <main class="form-signin">
    <form id="form1" runat="server">
       <img class="mb-4" style="vertical-align: middle!important;width: 200px!important;height: 200px!important;"src="theloop.png" width="40%"/>
    <div>
    
        <asp:Label ID="Label1" style="margin-bottom:0px!important;" Class="l" runat="server" Font-Names="Verdana" 
            Font-Size="X-Large" ForeColor="Black" 
            Text="Please sign in"></asp:Label>
        
        <br />
        <table class="style1">
            <tr>
                <td>
                    <div class="form-floating">
                    <asp:TextBox ID="txtUsername" Style=" width:100%!important;" class="form-control" runat="server" Font-Names="Arial" 
                        Font-Size="Medium" ForeColor="#000066" Width="175px" placeholder="Student ID"></asp:TextBox>
               </div> 
                    </td>
                
            </tr>
            <tr>
                
                <td class="auto-style2"><div class="form-floating">
                    <asp:TextBox ID="txtPassword" Style=" width:100%!important;" class="form-control" runat="server" Font-Names="Arial" 
                        Font-Size="Medium" ForeColor="#000066" TextMode="Password" Width="175px" placeholder="Password"></asp:TextBox>
                 </div> </td>
              
            </tr>
            <tr>
                <td class="auto-style4">
                    <label style="padding-left: 10px; padding-top: 15px; padding-bottom: 15px; display: inline-block; box-sizing: border-box;font-weight: 400;text-align: center!important;">
        <input type="checkbox" value="remember-me"> Remember me&nbsp;&nbsp;
                    <asp:DropDownList ID="portal" class="btn btn-secondary dropdown-toggle" runat="server">
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Teacher</asp:ListItem>
                    </asp:DropDownList>
      </label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnLogin" Class="w-100 btn btn-lg btn-primary" runat="server" Font-Names="Verdana" Font-Size="Medium" 
                        ForeColor="White"  Text="Sign In" OnClick="btnLogin_Click"/>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <table class="style1">
        <tr>
            <td class="style3">
                <asp:Label ID="lblMsg" runat="server" Font-Names="Verdana" 
                    Font-Size="X-Large" ForeColor="#993333"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
    </main>
    </div>
</body>
</html>
