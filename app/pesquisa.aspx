﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pesquisa.aspx.cs" Inherits="app_pesquisa" MasterPageFile="~/app/index.master" %>

<asp:Content ContentPlaceHolderID="indexBodyPlaceholder" runat="server">
    <form runat="server">
        <div class="mdl-grid mdl-cell mdl-cell--12-col card-box">
            <div class="mdl-card mdl-shadow--4dp mdl-cell mdl-cell--12-col mdl-grid" id="search-card">
                <div class="mdl-card__title mdl-cell mdl-cell-12-col">
                    <h2 class="mdl-card__title-text mdl-color-text--grey-600">
                        <i class="material-icons">search</i>
                        Critérios de Pesquisa
                    </h2>
                </div>

                <div class="card-content mdl-card--border mdl-grid mdl-cell mdl-cell--12-col">
                    <div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell--4-col-desktop mdl-cell--4-col-tablet">
                        <label class="simpleLabeldd" for="selectSeguroConsulta">Pesquisar em:</label>
                        <asp:DropDownList ID="selectTables" runat="server" class="dropdown" AutoPostBack="true" OnSelectedIndexChanged="selectTables_SelectedIndexChanged">
                            <asp:ListItem Text="Veículo" />
                            <asp:ListItem Text="Frota" />
                        </asp:DropDownList>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell--4-col-desktop mdl-cell--4-col-tablet">
                        <label class="simpleLabeldd" for="selectSeguroConsulta">Pesquisar por:</label>
                        <asp:DropDownList ID="selectAtribute" runat="server" class="dropdown">
                        </asp:DropDownList>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floatting-label mdl-cell mdl-cell--8-col-desktop mdl-cell--8-cel-tabet">
                        <asp:TextBox runat="server" class="mdl-textfield__input" type="text" ID="pesqQuery"></asp:TextBox>
                        <label class="mdl-textfield__label" for="pesqQuery">Busca</label>
                    </div>
                    <asp:Button Text="Pesquisar" ID="sinistroExistente" runat="server"
                        class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
                        OnClick="searchQuery"></asp:Button>
                </div>

            </div>

            <!-- Resultados -->
            <div class="card mdl-card mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid" id="response-card">
                <div class="mdl-card__title mdl-cell mdl-cell-12-col">
                    <h2 class="mdl-card__title-text mdl-color-text--grey-600">
                        <i class="material-icons">subject</i>
                        Resultados
                    </h2>
                </div>

                <div class="card-content mdl-card--border mdl-grid mdl-cell mdl-cell--12-col">
                    <asp:GridView ID="gvPesqVeiculo" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid"
                        BorderWidth="1px" CellPadding="3" ForeColor="Black" DataKeyNames="id_veiculo" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="Código" Visible="False" SortExpression="id_veiculo">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_veiculo") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_veiculo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CódigoCli" Visible="False" SortExpression="id_cli">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_cli") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_cli") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Marca" SortExpression="fabricante_veiculo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fabricante_veiculo")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("fabricante_veiculo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modelo" SortExpression="modelo_veiculo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("modelo_veiculo")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("modelo_veiculo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ano" SortExpression="ano_veiculo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ano_veiculo")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ano_veiculo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Placa" SortExpression="placa_veiculo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("placa_veiculo")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("placa_veiculo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cor" SortExpression="cor_veiculo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("cor_veiculo")%>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("cor_veiculo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                      </asp:GridView>

              <div class="card-content mdl-card--border mdl-grid mdl-cell mdl-cell--12-col">
                <asp:GridView ID="gvPesqFrota" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid"
                          BorderWidth="1px" CellPadding="3" ForeColor="Black" DataKeyNames="id_frota" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Código" Visible="False" SortExpression="id_frota">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_frota") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nome" SortExpression="nome_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nome_frota")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nome_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Modelo" SortExpression="modelo_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("modelo_frota")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("modelo_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ano" SortExpression="ano_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ano_frota")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ano_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marca" SortExpression="fabricante_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("fabricante_frota")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("fabricante_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo" SortExpression="tipo_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("tipo_frota")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("tipo_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Placa" SortExpression="placa_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("placa_frota")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("placa_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cor" SortExpression="cor_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("cor_frota")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("cor_frota") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Foto" SortExpression="img_frota">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("img_frota") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="54px" ImageUrl='<%# Eval("img_frota", "{0}") %>' Width="49px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                  </asp:GridView>

        </div>
    </form>

    <asp:SqlDataSource
        ID="sqlFull"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:amaralguinchoConnectionString %>"
        ProviderName="<%$ ConnectionStrings:amaralguinchoConnectionString.ProviderName %>"></asp:SqlDataSource>

</asp:Content>
