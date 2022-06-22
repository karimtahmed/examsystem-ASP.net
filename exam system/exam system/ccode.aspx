<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string strSelect = " ";
        // Authenticating the user

        // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|online_examination.mdf;Integrated Security=True";

       
            // 2- Create Sql Select statement string
            strSelect = "SELECT * FROM Course "
               + " WHERE Coursecode = '" + cc.Text + "'";
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
        {   string Coursecode = (string)reader.GetValue(0); 
            string CourseName = (string)reader.GetValue(1);
            
            HttpCookie coco = new HttpCookie("courseInfo");
            coco.Values.Add("cn", CourseName);
            coco.Values.Add("cc", Coursecode);

            coco.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(coco);
            
               
                Response.Redirect("~/coursex.aspx");
        }
        else
            lblMsg.Text = "Unknown course code, you may try again!!";

        // 8- Close the database
        conn.Close();

    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <style type="text/css">
         .w-100 {
   width: 150px!important;

         }
          .btn-primary {
    border-color: #50A4AC!important;
    background-color: #50A4AC!important;
    color: #fff;
    border-top-left-radius:0px;
    border-bottom-left-radius:0px;
}
.btn-primary:hover {
  background-color: #3f3a64!important;
  border-color: #3f3a64!important;
}
        .form-control {
            margin-right:0px!important;padding-right:0px!important;
        }
    </style>
</head>
<body>
    <div class="container" style="margin-top:270px;">
        <asp:Label ID="Label1"  style="margin-left:400px;" runat="server" Font-Names="Verdana" Font-Size="X-Large" ForeColor="Black" Text="Search your Course"></asp:Label>
        <br />
        <br />
    <form id="form1" runat="server" style="margin-left:200px;" class="row row-cols-lg-auto g-3 align-items-center">
        
        <br />
        
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

        </div>
       
        <asp:TextBox ID="cc" class="form-control" Style="width:350px!important;height:50px;margin-right:0px!important;padding-right:0px!important;"  runat="server"></asp:TextBox>
                    <asp:Button class="w-100 btn btn-lg btn-primary " style="padding: 0 40px; line-height: 50px;" ID="btnSubmit" runat="server" Text="browse" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMsg" runat="server" Font-Names="Verdana" Font-Size="XX-Large" ForeColor="#993333"></asp:Label>
    
        </form>
    </div>
</body>
</html>
