<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8"/>
	<xsl:template match='/club_voleibol'>
		<html lang="es">
			
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
				<meta charset="utf-8"/>
				<meta name="description" content="Página principal" />
				<title>titulo de la web</title>
			</head>
			
			<body>
				<header>
					<img src= "../img/logotipo.png" alt= "Reservas" />
					<a href="tienda.xml">Tienda</a>
					<a href="equipos.xml">Equipos</a>
					<a href="partidos.xml">Partidos</a>
				</header>
				
				<main>
					<h1>PARTIDOS</h1>
					<table>
						<tr>
							<th>PARTIDO</th>
							<th>FECHA</th>
							<th>RESULTADO</th>
						</tr>
						<!-- Seleccionamos los elementos partidos en orden descendente -->
						<xsl:apply-templates select="partido">
							<xsl:sort select="fecha" order="descending" />
						</xsl:apply-templates>
					</table>			
				</main>
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	<!-- Creamos la plantilla para los elementos partidos -->
	<xsl:template match="partido">
		
		<tr>
			<td><xsl:value-of select="equipos/local"/><xsl:text> - </xsl:text><xsl:value-of select="equipos/visitante"/></td>
			<td><xsl:value-of select="fecha"/></td>
			<td>
				<!-- Seleccionamos que cuando se cumpla la condición dada se ponga de color azul y el resto normal -->
				<xsl:choose>
					<xsl:when test="equipos/local/@puntuacion&lt;equipos/visitante/@puntuacion" >
						<span class="azul"><xsl:value-of select="equipos/local/@puntuacion"/><xsl:text> - </xsl:text><xsl:value-of select="equipos/visitante/@puntuacion"/></span>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="equipos/local/@puntuacion"/><xsl:text> - </xsl:text><xsl:value-of select="equipos/visitante/@puntuacion"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		
		
	</xsl:template>	
</xsl:stylesheet>