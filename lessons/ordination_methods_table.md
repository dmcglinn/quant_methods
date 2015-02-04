---
output: html_document
---


Overview of Ordination methods (adpated from http://ordination.okstate.edu/terminol.htm)


<table width="762" cellpadding="4" cellspacing="0">
    <col width="80">
	<col width="200">
	<col width="117">
	<col width="175">
	<col width="147">
	<tr valign="top">
		<td width="80" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0.04in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><b>Acronym</b></font></p>
		</td>
		<td width="200" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0.04in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><b>Name</b></font></p>
		</td>
		<td width="117" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0.04in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><b>Type of analysis</b></font></p>
		</td>
		<td width="175" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0.04in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><b>Algorithm</b></font></p>
		</td>
		<td width="147" style="border: 1px solid #000000; padding: 0.04in">
			<p><font face="Liberation Serif, serif"><b>R function(s)</b></font></p>
		</td>
	</tr>
	<tr valign="top">
		<td width="80" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif">PCA</font></p>
		</td>
		<td width="200" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Principal
			Components Analysis</font></font></p>
		</td>
		<td width="117" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">indirect</font></font></p>
		</td>
		<td width="175" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Eigenanalysis,
			SVD</font></font></p>
		</td>
		<td width="147" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0.04in">
			<p><font face="Liberation Serif, serif">stats::princomp,
			vegan::rda</font></p>
		</td>
	</tr>
	<tr valign="top">
		<td width="80" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt"><i>CA</i></font></font></p>
		</td>
		<td width="200" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Correspondence
			Analysis</font></font></p>
		</td>
		<td width="117" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">indirect</font></font></p>
		</td>
		<td width="175" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">RA,
			eigenanalysis, SVD</font></font></p>
		</td>
		<td width="147" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0.04in">
			<p><font face="Liberation Serif, serif">vegan::cca</font></p>
		</td>
	</tr>
	<tr valign="top">
		<td width="80" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt"><i>DCA</i></font></font></p>
		</td>
		<td width="200" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Detrended
			Correspondence Analysis</font></font></p>
		</td>
		<td width="117" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">indirect</font></font></p>
		</td>
		<td width="175" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">RA
			with detrending and rescaling</font></font></p>
		</td>
		<td width="147" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0.04in">
			<p style="font-variant: normal; font-style: normal; font-weight: normal; widows: 2; orphans: 2">
			<font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">vegan::decorana</font></font></p>
		</td>
	</tr>
	<tr valign="top">
		<td width="80" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt"><i>NMDS</i></font></font></p>
		</td>
		<td width="200" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif">Non-metric Mulidimensional
			Scaling</font></p>
		</td>
		<td width="117" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">indirect</font></font></p>
		</td>
		<td width="175" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif">Distance based ordination,
			non-eigenbased</font></p>
		</td>
		<td width="147" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0.04in">
			<p style="font-variant: normal; font-style: normal; font-weight: normal; widows: 2; orphans: 2">
			<font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">vegan::metaMDS</font></font></p>
		</td>
	</tr>
	<tr valign="top">
		<td width="80" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt"><i>RDA</i></font></font></p>
		</td>
		<td width="200" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Redundancy
			Analysis</font></font></p>
		</td>
		<td width="117" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Direct</font></font></p>
		</td>
		<td width="175" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Eigenanalysis,
			SVD</font></font></p>
		</td>
		<td width="147" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0.04in">
			<p><font face="Liberation Serif, serif">vegan::rda</font></p>
		</td>
	</tr>
	<tr valign="top">
		<td width="80" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt"><i>CCA</i></font></font></p>
		</td>
		<td width="200" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Canonical
			Correspondence Analysis</font></font></p>
		</td>
		<td width="117" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">direct</font></font></p>
		</td>
		<td width="175" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">RA
			with regressions, eigenanalysis</font></font></p>
		</td>
		<td width="147" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0.04in">
			<p><font face="Liberation Serif, serif">vegan::cca</font></p>
		</td>
	</tr>
	<tr valign="top">
		<td width="80" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt"><i>DCCA</i></font></font></p>
		</td>
		<td width="200" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">Detrended
			Canonical Correspondence Analysis</font></font></p>
		</td>
		<td width="117" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">direct</font></font></p>
		</td>
		<td width="175" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0in">
			<p><font face="Liberation Serif, serif"><font size="3" style="font-size: 12pt">RA
			with regressions and detrending</font></font></p>
		</td>
		<td width="147" style="border-top: none; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; padding-top: 0in; padding-bottom: 0.04in; padding-left: 0.04in; padding-right: 0.04in">
			<p><font face="Liberation Serif, serif">NA</font></p>
		</td>
	</tr>
</table>
