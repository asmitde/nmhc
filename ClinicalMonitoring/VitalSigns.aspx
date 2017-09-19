<%@ Page Title="Hospital | Clinical Monitoring" Language="C#" MasterPageFile="~/ClinicalMonitoring/ClinicalMonitoring.master" AutoEventWireup="true" CodeFile="VitalSigns.aspx.cs" Inherits="ClinicalMonitoring_VitalSigns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainContent" Runat="Server">
	<div>
		<h2>Vital Signs</h2>
	</div>
	<br />
	<br />
	<div>
        <h3>Search Patient</h3>
        <br />
        <table style="width: 100%">
            <tr>
                <td>
            Search by</td>
                <td colspan="2">
                    <asp:RadioButtonList ID="SearchBy" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Registration ID</asp:ListItem>
                <asp:ListItem>Bed No.</asp:ListItem> 
            </asp:RadioButtonList>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="SearchBox" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Search" runat="server" Text="Search" onclick="Search_Click" 
                        CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Literal ID="RegID" runat="server"></asp:Literal>
                </td>
                <td colspan="2">
                    <asp:Literal ID="PName" runat="server"></asp:Literal>
                </td>
                <td colspan="2">
                    <asp:Literal ID="PBed" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
    </div>
	<br />
	<asp:LinkButton ID="Complaints" runat="server" onclick="Complaints_Click">Patient Complaints</asp:LinkButton>
	<asp:LinkButton ID="OnExam" runat="server" onclick="OnExam_Click">OnExamination</asp:LinkButton>
	<asp:LinkButton ID="VitalSigns" runat="server" onclick="VitalSigns_Click">Vital Signs</asp:LinkButton>
	<asp:LinkButton ID="ClinicalParams" runat="server" onclick="ClinicalParams_Click">Clinical Parameters</asp:LinkButton>
	<asp:LinkButton ID="IntakeOutput" runat="server" onclick="IntakeOutput_Click">Intake / Output</asp:LinkButton>
	<asp:LinkButton ID="Ventilator" runat="server" onclick="Ventilator_Click">Ventilator Monitoring</asp:LinkButton>
	<asp:LinkButton ID="Cannulas" runat="server" OnClick="Cannulas_Click">Checklist (Cannulas...)</asp:LinkButton>
	<br />
	<br />
	<div>
        <asp:MultiView ID="MultiView1" runat="server" ViewStateMode="Enabled">
            <asp:View ID="View1" runat="server">
				<div>
					<asp:Label ID="DF" runat="server" Text="Date of Log:" />
					<asp:DropDownList ID="DateFilter" runat="server" AutoPostBack="True" 
						ViewStateMode="Enabled">
					</asp:DropDownList>
					<asp:ListView ID="ListView1" runat="server" DataKeyNames="P_ID,LogDate,LogTime" 
						 DataSourceID="EntityDataSource1" InsertItemPosition="FirstItem" >
						<InsertItemTemplate>
							<tr style="">
								<td>
									<asp:TextBox ID="LogTimeTextBox" runat="server" 
										Text='<%# Bind("LogTime") %>' />
								</td>
								<td>
									<asp:TextBox ID="PulseTextBox" runat="server" Text='<%# Bind("Pulse") %>' />
								</td>
								<td>
									<asp:TextBox ID="BloodPressure_SupineTextBox" runat="server" 
										Text='<%# Bind("BloodPressure_Supine") %>' />
								</td>
								<td>
									<asp:DropDownList ID="BPSupine_SiteList" runat="server"
										Text='<%# Bind("BPSupine_Site") %>'>
										<asp:ListItem>N/A</asp:ListItem>
										<asp:ListItem>Left Arm</asp:ListItem>
										<asp:ListItem>Right Arm</asp:ListItem>
										<asp:ListItem>Left Leg</asp:ListItem>
										<asp:ListItem>Right Leg</asp:ListItem>
									</asp:DropDownList>	 
								</td>
								<td>
									<asp:TextBox ID="BloodPressure_SittingTextBox" runat="server" 
										Text='<%# Bind("BloodPressure_Sitting") %>' />
								</td>
								<td>
									<asp:DropDownList ID="BPSitting_SiteList" runat="server"
										Text='<%# Bind("BPSitting_Site") %>'>
										<asp:ListItem>N/A</asp:ListItem>
										<asp:ListItem>Left Arm</asp:ListItem>
										<asp:ListItem>Right Arm</asp:ListItem>
										<asp:ListItem>Left Leg</asp:ListItem>
										<asp:ListItem>Right Leg</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:TextBox ID="BloodPressure_StandingTextBox" runat="server" 
										Text='<%# Bind("BloodPressure_Standing") %>' />
								</td>
								<td>
									<asp:DropDownList ID="BPStanding_SiteList" runat="server"
										Text='<%# Bind("BPStanding_Site") %>'>
										<asp:ListItem>N/A</asp:ListItem>
										<asp:ListItem>Left Arm</asp:ListItem>
										<asp:ListItem>Right Arm</asp:ListItem>
										<asp:ListItem>Left Leg</asp:ListItem>
										<asp:ListItem>Right Leg</asp:ListItem>
									</asp:DropDownList>
								</td>
								<td>
									<asp:TextBox ID="TemperatureTextBox" runat="server" 
										Text='<%# Bind("Temperature") %>' />
								</td>
								<td>
									<asp:TextBox ID="RespirationRateTextBox" runat="server" 
										Text='<%# Bind("RespirationRate") %>' />
								</td>
								<td>
									<asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
										Text="Insert" />
									<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
										Text="Clear" />
								</td>
							</tr>
						</InsertItemTemplate>
						<ItemTemplate>
							<tr style="">
								<td>
									<asp:Label ID="LogDateTimeLabel" runat="server" 
										Text='<%# Eval("LogTime") %>' />
								</td>
								<td>
									<asp:Label ID="PulseLabel" runat="server" Text='<%# Eval("Pulse") %>' />
								</td>
								<td>
									<asp:Label ID="BloodPressure_SupineLabel" runat="server" 
										Text='<%# Eval("BloodPressure_Supine") %>' />
								</td>
								<td>
									<asp:Label ID="BPSupine_SiteLabel" runat="server" 
										Text='<%# Eval("BPSupine_Site") %>' />
								</td>
								<td>
									<asp:Label ID="BloodPressure_SittingLabel" runat="server" 
										Text='<%# Eval("BloodPressure_Sitting") %>' />
								</td>
								<td>
									<asp:Label ID="BPSitting_SiteLabel" runat="server" 
										Text='<%# Eval("BPSitting_Site") %>' />
								</td>
								<td>
									<asp:Label ID="BloodPressure_StandingLabel" runat="server" 
										Text='<%# Eval("BloodPressure_Standing") %>' />
								</td>
								<td>
									<asp:Label ID="BPStanding_SiteLabel" runat="server" 
										Text='<%# Eval("BPStanding_Site") %>' />
								</td>
								<td>
									<asp:Label ID="TemperatureLabel" runat="server" 
										Text='<%# Eval("Temperature") %>' />
								</td>
								<td>
									<asp:Label ID="RespirationRateLabel" runat="server" 
										Text='<%# Eval("RespirationRate") %>' />
								</td>
								<td>
									<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
										Text="Delete" />
								</td>
							</tr>
						</ItemTemplate>
						<LayoutTemplate>
							<table id="Table2" runat="server">
								<tr id="Tr1" runat="server">
									<td id="Td1" runat="server">
										<table ID="itemPlaceholderContainer" runat="server" border="0" style="">
											<tr id="Tr2" runat="server" style="">
												<th id="Th1" runat="server">
													Time</th>
												<th id="Th2" runat="server">
													Pulse</th>
												<th id="Th3" runat="server">
													Blood Pressure (Supine)</th>
												<th id="Th4" runat="server">
													Site</th>
												<th id="Th5" runat="server">
													Blood Pressure (Sitting)</th>
												<th id="Th6" runat="server">
													Site</th>
												<th id="Th7" runat="server">
													Blood Pressure (Standing)</th>
												<th id="Th8" runat="server">
													Site</th>
												<th id="Th9" runat="server">
													Temperature</th>
												<th id="Th10" runat="server">
													RespirationRate</th>
												<th id="Th11" runat="server">
												</th>
											</tr>
											<tr ID="itemPlaceholder" runat="server">
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</LayoutTemplate>
					</asp:ListView>
					<asp:EntityDataSource ID="EntityDataSource1" runat="server" 
						ConnectionString="name=NMHCDatabaseEntities" 
						DefaultContainerName="NMHCDatabaseEntities" EnableDelete="True" 
						EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
						EntitySetName="Clinical_Monitoring__Vital_Signs" 
						Where="it.[P_ID] = @param_PID && it.[LogDate] = @param_Date" AutoSort="False" 
						OrderBy="it.[LogTime] desc"
						oninserting="EntityDataSource1_Inserting" EntityTypeFilter="" Select="" 
						ondeleted="EntityDataSource1_Deleted" oninserted="EntityDataSource1_Inserted">
						<WhereParameters>
							<asp:QueryStringParameter Name="param_PID" QueryStringField="PID" 
								Type="String" />
							<asp:ControlParameter ControlID="DateFilter" Name="param_Date" 
								PropertyName="SelectedValue" Type="DateTime" />
						</WhereParameters>
					</asp:EntityDataSource>
				</div>
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                    <h3>
                        Search Result
                    </h3>
                    <p>
                        Sorry, your search did not return any results. The Patient does not exist or is not registered under this hospital.</p>
            </asp:View>
        </asp:MultiView>
    </div>
	
</asp:Content>

