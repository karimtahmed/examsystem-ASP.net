<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>



<!DOCTYPE html>

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // 1- Create Connection Object
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|online_examination.mdf;Integrated Security=True";

        // 2- Create SQL Insert statement string

        string strInsert = String.Format("INSERT INTO Student VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}' , '{8}', '{9}')", Fname.Text, Lname.Text, Gender.SelectedValue, StudentID.Text, Password.Text, Address.Text, faculty.SelectedValue, level.Text, Birthdate.Text , null );

        // 3- Create SQL Command
        SqlCommand cmdInsert = new SqlCommand(strInsert, conn);

        try
        {

            // 4- Open the database
            conn.Open();

            // 5- Execute SQL Command
            cmdInsert.ExecuteNonQuery();

            // 6- Close the database
            conn.Close();

            // Save user profile picture
            //if (fupPic.HasFile)
            //    fupPic.SaveAs(Server.MapPath("userPic") + "\\" + StudentID.Text + "jpg");

            lblMsg.Text = "Welcome " + Fname.Text + ", Your Account has been Successfully Created!!";
        }

        catch (SqlException err)
        {
            if (err.Number == 2627)
                lblMsg.Text = "The Username " + StudentID.Text + " already used, Please choose another !!";
            else
                lblMsg.Text = "Database error, Please try later !!";
        }

        catch
        {
            lblMsg.Text = "The system is not available at the moment, you may try later !!";
        }

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 159px;
        }
        .auto-style5 {
            width: 288px;
        }
        .auto-style10 {
            width: 159px;
            height: 32px;
        }
        .auto-style13 {
            width: 288px;
            height: 32px;
        }
        .auto-style14 {
            width: 37px;
            height: 32px;
        }
        .auto-style17 {
            width: 37px;
        }
        .auto-style21 {
            width: 159px;
            height: 35px;
        }
        .auto-style22 {
            width: 37px;
            height: 35px;
        }
        .auto-style24 {
            width: 288px;
            height: 35px;
        }
        .auto-style29 {
            height: 13px;
        }
        .auto-style46 {
            width: 159px;
            height: 23px;
        }
        .auto-style47 {
            width: 37px;
            height: 23px;
        }
        .auto-style49 {
            width: 288px;
            height: 23px;
        }
        .auto-style51 {
            height: 40px;
        }
        .auto-style52 {
            width: 159px;
            height: 40px;
        }
        .auto-style53 {
            width: 159px;
            height: 51px;
        }
        .auto-style54 {
            width: 37px;
            height: 51px;
        }
        .auto-style56 {
            width: 288px;
            height: 51px;
        }
        .container {
  padding: 16px;
  max-width:900px;
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
        .auto-style57 {
            width: 122px;
            height: 32px;
        }
        .auto-style58 {
            width: 122px;
        }
        .auto-style59 {
            width: 122px;
            height: 23px;
        }
        .auto-style63 {
            width: 122px;
            height: 35px;
        }
        .auto-style65 {
            width: 122px;
            height: 51px;
        }
        .auto-style76 {
            margin-right: 202px;
        }
        .btn {
    font-size: 14px;
    font-weight: 700;
    
    border-width: 1px;
    border-style: solid;
    border-radius: 5px;
    
}
.btn-info {
    border-color:  #50A4AC;
    background-color:  #50A4AC;
    color: #fff;
}
.btn-info:hover {
  background-color: #3f3a64;
  border-color: #3f3a64;
}
        .auto-style77 {
            width: 159px;
            height: 92px;
        }
        .auto-style78 {
            width: 37px;
            height: 92px;
        }
        .auto-style79 {
            width: 122px;
            height: 92px;
        }
        .auto-style80 {
            width: 288px;
            height: 92px;
        }
        .auto-style81 {
            width: 159px;
            height: 11px;
        }
        .auto-style82 {
            width: 37px;
            height: 11px;
        }
        .auto-style83 {
            width: 122px;
            height: 11px;
        }
        .auto-style84 {
            width: 288px;
            height: 11px;
        }
        .auto-style86 {
            width: 37px;
            height: 27px;
        }
        .auto-style87 {
            width: 122px;
            height: 27px;
        }
        .auto-style88 {
            width: 288px;
            height: 27px;
        }
        .auto-style89 {
            width: 159px;
            height: 27px;
        }
        .auto-style90 {
            width: 159px;
            height: 33px;
        }
        .auto-style91 {
            width: 37px;
            height: 33px;
        }
        .auto-style92 {
            width: 122px;
            height: 33px;
        }
        .auto-style93 {
            width: 288px;
            height: 33px;
        }
        .auto-style95 {
            width: 37px;
            height: 60px;
        }
        .auto-style96 {
            width: 122px;
            height: 60px;
        }
        .auto-style97 {
            width: 288px;
            height: 60px;
        }
        .auto-style98 {
            width: 159px;
            height: 60px;
        }
    </style>
</head>
<body style="align-items: center!important; background-color: #f5f5f5;">
    <div class="container shadow p-3 mb-5 bg-body rounded border border-5" style="border-radius:5px; ">
                         
    <form id="form1" runat="server">
        <div class="auto-style76"> 
            <a class="navbar-brand" href="#" style="max-width:158px;"><img src="loop (1).png" width="80px" style="line-height: 1.375;max-width: 100%;padding-bottom:6px;"></a>
            <asp:Label ID="Label1" class="h3 mb-3 fw-normal" runat="server" Font-Names="Arial" Font-Size="XX-Large" ForeColor="Black" Text="Sign up"></asp:Label>
        <table class="w-75">
            <tr>
                <td class="auto-style90">
                    <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style91">
                    <asp:TextBox ID="Fname" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Width="164px"></asp:TextBox>
                </td>
                <td class="auto-style92">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Fname" ErrorMessage="This is a required filed" Font-Names="Arial" ForeColor="#990000"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style93">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Fname" ErrorMessage="every name must start with a capital" Font-Names="Arial" Font-Size="Small" ForeColor="#990000" ValidationExpression="[A-Z][a-z]*"></asp:RegularExpressionValidator>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style77">
                    <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style78">
                    <asp:TextBox ID="Lname" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Width="164px"></asp:TextBox>
                </td>
                <td class="auto-style79">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Lname" ErrorMessage="This is a required filed" Font-Names="Arial" ForeColor="#990000"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style80">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Lname" ErrorMessage="every name must start with a capital" Font-Names="Arial" Font-Size="Small" ForeColor="#990000" ValidationExpression="[A-Z][a-z]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style46">
                    <asp:Label ID="Label4" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Gender"></asp:Label>
                    <br />
                </td>
                <td class="auto-style47">
                    <asp:RadioButtonList ID="Gender" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" RepeatDirection="Horizontal" Width="168px">
                        <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style59"></td>
                <td class="auto-style49"></td>
            </tr>
            <tr>
                <td class="auto-style81">
                    <asp:Label ID="Label5" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Student ID"></asp:Label>
                    <br />
                    <br />
                </td>
                <td class="auto-style82">
                    <asp:TextBox ID="StudentID" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Width="164px"></asp:TextBox><br>
                    <font face="arial"color="#000020" size="-1">Example:20180208</font>
                </td>
                <td class="auto-style83">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="StudentID" ErrorMessage="This is a required filed" Font-Names="Arial" ForeColor="#990000"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style84">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="StudentID" ErrorMessage="Invalid ID format" Font-Names="Arial" Font-Size="Small" ForeColor="#990000" ValidationExpression="[2][0]\d{6}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Level"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="level" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Width="164px" ></asp:TextBox>
                </td>
                <td class="auto-style57">
                    &nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Faculty"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList class="btn btn-secondary dropdown-toggle" ID="faculty" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black">
                        <asp:ListItem Selected="True" Value="cs">Computer science</asp:ListItem>
                        <asp:ListItem Value="en">engineering</asp:ListItem>
                        <asp:ListItem Value="de">dentistry</asp:ListItem>
                        <asp:ListItem Value="ph">pharmacy</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Password"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="Password" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" TextMode="Password" Width="164px"></asp:TextBox>
                </td>
                <td class="auto-style58">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Password" ErrorMessage="This is a required filed" Font-Names="Arial" ForeColor="#990000"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="Password" ErrorMessage="8 to 12 character" ValidationExpression="\w{8,12}" ForeColor="#993333"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style89">
                    <asp:Label ID="Label10" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Retype Password"></asp:Label>
                </td>
                <td class="auto-style86">
                    <asp:TextBox ID="txtRetypePass" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" TextMode="Password" Width="164px"></asp:TextBox>
                </td>
                <td class="auto-style87">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRetypePass" ErrorMessage="This is a required filed" Font-Names="Arial" ForeColor="#990000"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style88">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="txtRetypePass" ErrorMessage="not matching" ForeColor="Maroon"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style98">
                    <asp:Label ID="pic2" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="course"></asp:Label>
                </td>
                <td class="auto-style95">
                    <asp:TextBox ID="txtcourse" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Width="164px"></asp:TextBox>
                </td>
                <td class="auto-style96">
                    &nbsp;&nbsp;
                    </td>
                <td class="auto-style97">
                </td>
            </tr>
            <tr>
                <td class="auto-style52">
                    <asp:Label ID="pic3" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="Address"></asp:Label>
                </td>
                <td colspan="3" class="auto-style51">
                    <asp:TextBox ID="Address" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Width="439px"></asp:TextBox>
                </td>
            </tr>
            <tr>

                <td class="auto-style53">
                    <asp:Label ID="pic4" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Text="birthdate"></asp:Label>
                </td>
                <td class="auto-style54">
                    <asp:TextBox ID="Birthdate" runat="server" Font-Names="Arial" Font-Size="Medium" ForeColor="Black" Width="164px" TextMode="Date"></asp:TextBox>
                </td>
                <td class="auto-style65">
                    &nbsp;</td>
                <td class="auto-style56">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21 ">
                    <asp:Button class="btn btn-info hvr-icon-down mb-3 " style="padding: 0 40px; line-height: 50px;" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                </td>
                <td class="auto-style22">
                </td>
                <td class="auto-style63"></td>
                <td class="auto-style24"></td>
            </tr>
            <tr>
                <td class="auto-style29" colspan="4">
            <asp:Label ID="lblMsg" runat="server" Font-Names="Verdana" Font-Size="XX-Large" ForeColor="#993333"></asp:Label>
                </td>
            </tr>
            </table>
        </div>
    </form>
    </div>
</body>
</html>
