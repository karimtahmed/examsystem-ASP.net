<%@ Page Title="" Language="C#" MasterPageFile="~/question.Master" AutoEventWireup="true" CodeBehind="Q.aspx.cs" Inherits="exam_system.WebForm2" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string time = "";
        string ecode = "";
        string ename = "";



        if (Request.Cookies["examInfo"] != null)
        {

            ecode = Request.Cookies["examInfo"].Values["ecode"];
            ename = Request.Cookies["examInfo"].Values["ename"];
            time = Request.Cookies["examInfo"].Values["etime"];

        }
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|online_examination.mdf;Integrated Security=True";




        // 2- Create Sql Select statement string
        string strSelect = "SELECT * FROM question "
            + " WHERE examID = '" + ecode + "'";

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
            //string Qnum1 = (string)reader.GetValue(0);
            //string Q1 = (string)reader.GetValue(1);
            //string CA1 = (string)reader.GetValue(2);
            lblMsg1.Text = ecode;




        }

        conn.Close();

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|online_examination.mdf;Integrated Security=True";
        int counter =0;

        string l="";
        string Q = "";
        string ans = "";
        for (int i = 1; i <= 5; i++)
        {
            l = i.ToString();
            Q = "SELECT * FROM question"
              + " WHERE QID = '" + l + "'";

            SqlCommand cmdSelect = new SqlCommand(Q, conn);

            // 4- Create Sql Data Reader
            SqlDataReader reader;

            // 5- Open the databse
            conn.Open();

            // 6- Execute Sql command
            reader = cmdSelect.ExecuteReader();

            // 7- Check reader

            if (reader.Read())
            {
                ans= (string)reader.GetValue(2);

                if (rb1.SelectedValue == ans && i == 1)
                {
                    counter++;

                }
                if (rb2.SelectedValue == ans && i == 2)
                {
                    counter++;

                }
                if (rb3.SelectedValue == ans && i == 3)
                {
                    counter++;

                }
                if (rb4.SelectedValue == ans && i == 4)
                {
                    counter++;

                }
                if (rb5.SelectedValue == ans && i == 5)
                {
                    counter++;

                }
                //counter = counter+100;
            }
            string c=counter.ToString();
            HttpCookie coco = new HttpCookie("scoreInfo");
            coco.Values.Add("count", c);
            coco.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(coco);


            lblMsg.Text = "your score is : " + counter;
            conn.Close();
        }
    }
    protected void btnuse_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/coursex.aspx");

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <style type="text/css">
.w-75{width:75%!important}*,::after,::before{text-shadow:none!important;box-shadow:none!important}*,::after,::before{box-sizing:border-box}
        .auto-style90 {
            height: 33px;
        }
        button,input{overflow:visible}button,input,optgroup,select,textarea{margin:0;font-family:inherit;font-size:inherit;line-height:inherit}
        .auto-style77 {
            height: 92px;
        }
        .auto-style46 {
            height: 23px;
        }
        input[type=checkbox],input[type=radio]{box-sizing:border-box;padding:0}label{display:inline-block;margin-bottom:.5rem}
        .auto-style81 {
            height: 11px;
        }
        .auto-style10 {
            height: 32px;
        }
        .btn {
    font-size: 14px;
    font-weight: 700;
    
    border-width: 1px;
    border-style: solid;
    border-radius: 5px;
    
}
        .btn-secondary {
            color:white !important;
            background-color:white;
            background-color:  #50A4AC;
        }
        .dropdown-toggle{white-space:nowrap}.btn-secondary{color:#fff;background-color:#6c757d;border-color:#6c757d}.btn{transition:none}.btn{display:inline-block;font-weight:400;color:#212529;text-align:center;vertical-align:middle;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-color:transparent;border:1px solid transparent;padding:.375rem .75rem;font-size:1rem;line-height:1.5;border-radius:.25rem;transition:color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out}select{word-wrap:normal}button,select{text-transform:none}
        .auto-style98 {
            height: 60px;
        }
        .auto-style51 {
            height: 40px;
        }
        .auto-style53 {
            height: 51px;
        }
        .auto-style21 {
            width: 159px;
            height: 35px;
        }
        .btn-info {
    border-color:  #50A4AC;
    background-color:  #50A4AC;
    color: #fff;
}
.mb-3,.my-3{margin-bottom:1rem!important}.btn-info{color:#fff;background-color:#17a2b8;border-color:#17a2b8}[type=button],[type=reset],[type=submit],button{-webkit-appearance:button}
        .auto-style22 {
            width: 149px;
            height: 35px;
        }
        .auto-style63 {
            width: 166px;
            height: 35px;
        }
        .auto-style24 {
            width: 383px;
            height: 35px;
        }
        .auto-style29 {
            height: 13px;
        }
        .auto-style99 {
        border-collapse: collapse;
    }
        .auto-style101 {
            margin-right: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="border:solid 1px!important; max-width:600px!important;border-radius:5px!important;background-color:#f5f5f5;">
    <table class="auto-style99">
    <tr>
        <td class="auto-style90" colspan="4">
            <asp:Label ID="lblMsg1" runat="server" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" Visible="False"></asp:Label>
            &nbsp;
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" GridLines="None" HorizontalAlign="Center" ShowHeader="False" Width="412px">
                <Columns>
                    <asp:BoundField DataField="Q" HeaderText="Q" SortExpression="Q" >
                    <ItemStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Q] FROM [question] WHERE (([QID] = @QID) AND ([examID] = @examID))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="QID" Type="String" />
                    <asp:ControlParameter ControlID="lblMsg1" Name="examID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </td>
    </tr>
    <tr>
        <td class="auto-style77" colspan="4">
                    <asp:RadioButtonList ID="rb1" runat="server" DataSourceID="SqlDataSource2" DataTextField="ans" DataValueField="ans" CssClass="auto-style101" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" Height="56px" RepeatDirection="Horizontal" Width="517px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ans] FROM [answer] WHERE ([QID] = @QID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="QID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style46" colspan="4">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" GridLines="None" HorizontalAlign="Center" ShowHeader="False" Width="412px">
                <Columns>
                    <asp:BoundField DataField="Q" HeaderText="Q" SortExpression="Q" >
                    <ItemStyle Font-Names="Verdana" Font-Size="Medium" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Q] FROM [question] WHERE (([QID] = @QID) AND ([examID] = @examID))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="QID" Type="String" />
                    <asp:ControlParameter ControlID="lblMsg1" Name="examID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style81" colspan="4">
                    <asp:RadioButtonList ID="rb2" runat="server" DataSourceID="SqlDataSource4" DataTextField="ans" DataValueField="ans" CssClass="auto-style101" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" Height="56px" RepeatDirection="Horizontal" Width="517px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ans] FROM [answer] WHERE ([QID] = @QID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2" Name="QID" Type="String" />
                        </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </td>
    </tr>
    <tr>
        <td class="auto-style10" colspan="4">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" GridLines="None" HorizontalAlign="Center" ShowHeader="False" Width="412px">
                <Columns>
                    <asp:BoundField DataField="Q" HeaderText="Q" SortExpression="Q" >
                    <ItemStyle Font-Names="Verdana" Font-Size="Medium" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Q] FROM [question] WHERE ([QID] = @QID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="3" Name="QID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style2" colspan="4">
                    <asp:RadioButtonList ID="rb3" runat="server" DataSourceID="SqlDataSource6" DataTextField="ans" DataValueField="ans" CssClass="auto-style101" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" Height="56px" RepeatDirection="Horizontal" Width="517px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ans] FROM [answer] WHERE ([QID] = @QID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="QID" Type="String" />
                        </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style98" colspan="4">
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" GridLines="None" HorizontalAlign="Center" ShowHeader="False" Width="412px">
                <Columns>
                    <asp:BoundField DataField="Q" HeaderText="Q" SortExpression="Q" >
                    <ItemStyle Font-Names="Verdana" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Q] FROM [question] WHERE (([QID] = @QID) AND ([examID] = @examID))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="4" Name="QID" Type="String" />
                    <asp:ControlParameter ControlID="lblMsg1" Name="examID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style51" colspan="4">
                    <asp:RadioButtonList ID="rb4" runat="server" DataSourceID="SqlDataSource8" DataTextField="ans" DataValueField="ans" CssClass="auto-style101" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" Height="56px" RepeatDirection="Horizontal" Width="517px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ans] FROM [answer] WHERE ([QID] = @QID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="4" Name="QID" Type="String" />
                        </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style53" colspan="4">
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" GridLines="None" HorizontalAlign="Center" ShowHeader="False" Width="412px">
                <Columns>
                    <asp:BoundField DataField="Q" HeaderText="Q" SortExpression="Q" >
                    <ItemStyle Font-Names="Verdana" Font-Size="Medium" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Q] FROM [question] WHERE ([QID] = @QID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="5" Name="QID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style53" colspan="4">
                    <asp:RadioButtonList ID="rb5" runat="server" DataSourceID="SqlDataSource10" DataTextField="ans" DataValueField="ans" CssClass="auto-style101" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" Height="56px" RepeatDirection="Horizontal" Width="517px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ans] FROM [answer] WHERE ([QID] = @QID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="5" Name="QID" Type="String" />
                        </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style21 ">
            &nbsp;&nbsp;
            <asp:Button class="btn btn-info hvr-icon-down mb-3 " style="padding: 0 40px; line-height: 50px;" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </td>
        <td class="auto-style22"></td>
        <td class="auto-style63"></td>
        <td class="auto-style24">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button class="btn btn-info hvr-icon-down mb-3 " style="padding: 0 40px; line-height: 50px;" ID="btnSubmit0" runat="server" OnClick="btnuse_Click" Text="return to course" />
        </td>
    </tr>
    <tr>
        <td class="auto-style29" colspan="4">
            <asp:Label ID="lblMsg" runat="server" Font-Names="Verdana" Font-Size="X-Large" ForeColor="Black"></asp:Label>
        </td>
    </tr>
</table>

    </div>
</asp:Content>
