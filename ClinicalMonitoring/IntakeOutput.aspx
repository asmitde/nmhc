<%@ Page Title="Hospital | Clinical Monitoring" Language="C#" MasterPageFile="~/ClinicalMonitoring/ClinicalMonitoring.master" AutoEventWireup="true" CodeFile="IntakeOutput.aspx.cs" Inherits="ClinicalMonitoring_IntakeOutput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMainContent" Runat="Server">
	<div>
		<h2>Intake - Output</h2>
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
						 DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" >
						<InsertItemTemplate>
							<tr style="">
								<td>
									<asp:TextBox ID="LogTimeTextBox" runat="server" Text='<%# Bind("LogTime") %>' />
								</td>
								<td>
									<asp:TextBox ID="OralIntakeTextBox" runat="server" 
										Text='<%# Bind("OralIntake") %>' />
								</td>
								<td>
									<asp:TextBox ID="RylesTubeIntakeTextBox" runat="server" 
										Text='<%# Bind("RylesTubeIntake") %>' />
								</td>
								<td>
									<asp:TextBox ID="Gastrostomy_JejunostomyTubeIntakeTextBox" runat="server" 
										Text='<%# Bind("Gastrostomy_JejunostomyTubeIntake") %>' />
								</td>
								<td>
									<asp:TextBox ID="IntravenousFluidIntakeTextBox" runat="server" 
										Text='<%# Bind("IntravenousFluidIntake") %>' />
								</td>
								<td>
									<asp:CheckBox ID="LasixCheckBox" runat="server" 
										Checked='<%# Bind("Lasix") %>' />
								</td>
								<td>
									<asp:TextBox ID="LasixDosageTextBox" runat="server" 
										Text='<%# Bind("LasixDosage") %>' />
								</td>
								<td>
									<asp:TextBox ID="UrineOutputTextBox" runat="server" 
										Text='<%# Bind("UrineOutput") %>' />
								</td>
								<td>
									<asp:TextBox ID="StoolOutputTextBox" runat="server" 
										Text='<%# Bind("StoolOutput") %>' />
								</td>
								<td>
									<asp:TextBox ID="ChestDrainOutputTextBox" runat="server" 
										Text='<%# Bind("ChestDrainOutput") %>' />
								</td>
								<td>
									<asp:TextBox ID="PeritonealDrainOutputTextBox" runat="server" 
										Text='<%# Bind("PeritonealDrainOutput") %>' />
								</td>
								<td>
									<asp:TextBox ID="PericardialDrainOutputTextBox" runat="server" 
										Text='<%# Bind("PericardialDrainOutput") %>' />
								</td>
								<td>
									<asp:TextBox ID="CSFDrainOutputTextBox" runat="server" 
										Text='<%# Bind("CSFDrainOutput") %>' />
								</td>
								<td>
									<asp:TextBox ID="RylesTubeSuctionOutputTextBox" runat="server" 
										Text='<%# Bind("RylesTubeSuctionOutput") %>' />
								</td>
								<td>
									<asp:TextBox ID="InstructionsTextBox" runat="server" 
										Text='<%# Bind("Instructions") %>' />
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
									<asp:Label ID="LogTimeLabel" runat="server" Text='<%# Eval("LogTime") %>' />
								</td>
								<td>
									<asp:Label ID="OralIntakeLabel" runat="server" 
										Text='<%# Eval("OralIntake") %>' />
								</td>
								<td>
									<asp:Label ID="RylesTubeIntakeLabel" runat="server" 
										Text='<%# Eval("RylesTubeIntake") %>' />
								</td>
								<td>
									<asp:Label ID="Gastrostomy_JejunostomyTubeIntakeLabel" runat="server" 
										Text='<%# Eval("Gastrostomy_JejunostomyTubeIntake") %>' />
								</td>
								<td>
									<asp:Label ID="IntravenousFluidIntakeLabel" runat="server" 
										Text='<%# Eval("IntravenousFluidIntake") %>' />
								</td>
								<td>
									<asp:CheckBox ID="LasixCheckBox" runat="server" Checked='<%# Eval("Lasix") %>' 
										Enabled="false" />
								</td>
								<td>
									<asp:Label ID="LasixDosageLabel" runat="server" 
										Text='<%# Eval("LasixDosage") %>' />
								</td>
								<td>
									<asp:Label ID="UrineOutputLabel" runat="server" 
										Text='<%# Eval("UrineOutput") %>' />
								</td>
								<td>
									<asp:Label ID="StoolOutputLabel" runat="server" 
										Text='<%# Eval("StoolOutput") %>' />
								</td>
								<td>
									<asp:Label ID="ChestDrainOutputLabel" runat="server" 
										Text='<%# Eval("ChestDrainOutput") %>' />
								</td>
								<td>
									<asp:Label ID="PeritonealDrainOutputLabel" runat="server" 
										Text='<%# Eval("PeritonealDrainOutput") %>' />
								</td>
								<td>
									<asp:Label ID="PericardialDrainOutputLabel" runat="server" 
										Text='<%# Eval("PericardialDrainOutput") %>' />
								</td>
								<td>
									<asp:Label ID="CSFDrainOutputLabel" runat="server" 
										Text='<%# Eval("CSFDrainOutput") %>' />
								</td>
								<td>
									<asp:Label ID="RylesTubeSuctionOutputLabel" runat="server" 
										Text='<%# Eval("RylesTubeSuctionOutput") %>' />
								</td>
								<td>
									<asp:Label ID="InstructionsLabel" runat="server" 
										Text='<%# Eval("Instructions") %>' />
								</td>
								<td>
									<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
										Text="Delete" />
								</td>
							</tr>
						</ItemTemplate>
						<LayoutTemplate>
							<table runat="server">
								<tr runat="server">
									<td runat="server">
										<table ID="itemPlaceholderContainer" runat="server" border="0" style="">
											<tr runat="server" style="">
												<th runat="server">
													Log Time</th>
												<th runat="server">
													Oral Intake</th>
												<th runat="server">
													Ryles TubeIntake</th>
												<th runat="server">
													Gastrostomy/Jejunostomy Tube Intake</th>
												<th runat="server">
													Intravenous Fluid Intake</th>
												<th runat="server">
													Lasix</th>
												<th runat="server">
													Lasix Dosage</th>
												<th runat="server">
													Urine Output</th>
												<th runat="server">
													Stool Output</th>
												<th runat="server">
													Chest Drain Output</th>
												<th runat="server">
													Peritoneal Drain Output</th>
												<th runat="server">
													Pericardial Drain Output</th>
												<th runat="server">
													CSF Drain Output</th>
												<th runat="server">
													Ryles Tube Suction Output</th>
												<th runat="server">
													Instructions</th>
												<th runat="server">
												</th>
											</tr>
											<tr ID="itemPlaceholder" runat="server">
											</tr>
										</table>
									</td>
								</tr>
								<tr runat="server">
									<td runat="server" style="">
									</td>
								</tr>
							</table>
						</LayoutTemplate>
					</asp:ListView>
					<asp:EntityDataSource ID="EntityDataSource1" runat="server" 
						ConnectionString="name=NMHCDatabaseEntities" 
						DefaultContainerName="NMHCDatabaseEntities" EnableDelete="True" 
						EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
						EntitySetName="Clinical_Monitoring__Intake_Output" 
						Where="it.[P_ID] = @param_PID && it.[LogDate] = @param_Date" AutoSort="False" 
						OrderBy="it.[LogTime] desc"
						oninserting="EntityDataSource1_Inserting" 
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
