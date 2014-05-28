<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method ="html" media-type ="text/html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" encoding="utf-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Табло самолетов</title>
        <link href="board.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <table id="fltable">
          <tr>
            <th >Flight number</th>
            <th >Departure airport</th>
            <th>Departure time</th>
            <th>Arrival time</th>
            <th>Rescheduled flight</th>
          </tr>
          <xsl:apply-templates/>
         <script type="text/javascript" src="board.js"></script>
        </table>
        <div id="mess" class="messDiv"></div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match ="flights">
    <xsl:apply-templates select="flight"/>
  </xsl:template>
  <xsl:template match="flight">
      <tr>
        <td><xsl:value-of select="@number"/></td>
        <xsl:apply-templates/>
      </tr>
  </xsl:template>
  <xsl:template match="fromAirport">
      <td onmouseover="tooltip(this,printFullCityName(this.textContent))">
        <xsl:value-of select="@city"/>
      </td>
  </xsl:template>
  <xsl:template match="startTimes">
    <td>
      <table class="time">
        <xsl:for-each select ="startTime">
          <tr>
            <td onmouseover="tooltip(this,'Плановое время вылета')" onmouseout="hide_info(this)">
              <xsl:value-of select="@plan"/>
            </td>
            <td onmouseover="tooltip(this,'Реальное время вылета')" onmouseout="hide_info(this)">
              <xsl:value-of select="@real"/>
            </td>
            <td onmouseover="tooltip(this,'Время прогноза вылета')" onmouseout="hide_info(this)">
              <xsl:value-of select="@forecast"/>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </td>
  </xsl:template>
  <xsl:template match="comeTimes">
    <td>
      <table class="time">
        <xsl:for-each select="comeTime">
          <tr>
            <td onmouseover="tooltip(this,'Плановое время прилета')" onmouseout="hide_info(this)">
              <xsl:value-of select="@plan"/>
            </td>
            <td onmouseover="tooltip(this,'Реальное время прилета')" onmouseout="hide_info(this)">
              <xsl:value-of select="@real"/>
            </td>
            <td onmouseover="tooltip(this,'Прогноз времени прилета')" onmouseout="hide_info(this)">
              <xsl:value-of select="@forecast"/>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </td>
  </xsl:template>
  <xsl:template match="changeCitys">
    <td>
      <table class="change">
        <xsl:for-each select="changeDestAirpot">
          <tr class="change">
            <td onmouseover="tooltip(this,printFullCityName(this.textContent))" onmouseout="hide_info(this) " class="change">
              <xsl:value-of select="@city"/>
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </td>
  </xsl:template>
</xsl:stylesheet>