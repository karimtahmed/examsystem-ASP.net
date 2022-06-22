
<%@ Page Title="" Language="C#" MasterPageFile="~/cexam.Master"%>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

   <script runat="server">
       
       protected void Page_Load(object sender, EventArgs e)
       { string strSelect= " ";
           string Coursecode = "";
           // Authenticating the user

           // 1- Create Connection Object
           SqlConnection conn = new SqlConnection();
           conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|online_examination.mdf;Integrated Security=True";

           if (Request.Cookies["courseInfo"] != null)
           {
               Coursecode = Request.Cookies["courseInfo"].Values["cc"];
               strSelect = "SELECT * FROM exam "
                       + " WHERE Coursecode = '" + Coursecode + "'";

           }
           // 2- Create Sql Select statement string



           // 3- Create Sql command
           SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

           // 4- Create Sql Data Reader
           SqlDataReader reader;

           // 5- Open the databse
           conn.Open();

           // 6- Execute Sql command
           reader = cmdSelect.ExecuteReader();
           if (GridView1.SelectedValue != null)
           {
               string examcode = GridView1.SelectedRow.Cells[1].Text;
               string examname = GridView1.SelectedRow.Cells[2].Text;
               string etime = GridView1.SelectedRow.Cells[3].Text;
               HttpCookie coco = new HttpCookie("examInfo");
               coco.Values.Add("ecode", examcode);
               coco.Values.Add("ename", examname);

               coco.Values.Add("etime", etime);

               coco.Expires = DateTime.Now.AddDays(3);
               Response.Cookies.Add(coco);
               Response.Redirect("~/Q.aspx");
           }
           // 7- Check reader
           if (reader.Read())
           {

               //if (portal.SelectedValue == "Student")
               //{


               //HttpCookie coco = new HttpCookie("userInfo");
               //coco.Values.Add("SID", txtUsername.Text);
               //coco.Values.Add("passw", txtPassword.Text);

               //coco.Values.Add("Fn", Fname);
               //coco.Values.Add("Ln", Lname);

               //coco.Expires = DateTime.Now.AddDays(3);
               //Response.Cookies.Add(coco);

               //Response.Redirect("~/ccode.aspx");
               //}
               //else if (portal.SelectedValue == "Admin")
               //    Response.Redirect("~/index.html");

               lb1.Text =  Coursecode ;
           }
           else
               lb1.Text = "Invalid Username and/or Password, you may try again!!";

           // 8- Close the database
           conn.Close();

       }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lb1" runat="server" Text="Label" Font-Names="Verdana" Font-Size="X-Large" ForeColor="Black" Visible="False"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="examcode" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Large" Height="216px" Width="630px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True"/>
            <asp:BoundField DataField="examcode" HeaderText="examcode" ReadOnly="True" SortExpression="examcode" />
            <asp:BoundField DataField="examName" HeaderText="examName" SortExpression="examName" />
            <asp:BoundField DataField="examtime" HeaderText="examtime" SortExpression="examtime" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [examcode], [examName], [examtime] FROM [exam] WHERE ([Coursecode] = @Coursecode)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lb1" Name="Coursecode" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
