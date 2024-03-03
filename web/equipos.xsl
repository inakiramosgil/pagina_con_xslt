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
					<!-- Le damos a la variable entrenador el nombre de Julio Velasco, por si queremos cambiar el nombre del entrenador y nos proporcione los datos del nuevo. -->
					<xsl:variable name="entrenador" select="'Julio Velasco'"/>
					<!-- Recorremos el equipo con la condicón del nombre del entrenador -->
					<xsl:for-each select="//equipo[entrenador/nombre=$entrenador]">
						
						<!-- Recorremos los entrenadores buscando el nombre que le hemos dado a la variable -->
						<xsl:for-each select="entrenador[nombre=$entrenador]">
							
							<h1><a href="{url}"><xsl:value-of select='$entrenador'/></a></h1>
						</xsl:for-each>
						<article class="equipos">
							<!-- Le damos a la variable equipo el nombre del nombre del equipo -->
							<xsl:variable name="equipo" select="nombre"/>
							<!-- Recorremos los jugadores titulares del entrenador que hemos seleccionado -->
							<xsl:for-each select="//equipo/jugadores/jugador[@titular='si'][../preceding-sibling::entrenador/nombre=$entrenador]">
								<!-- Selecionamos la posición número 1 para el nombre del equipo -->
								<xsl:if test="position()=1">
									<h4><xsl:value-of select="$equipo"/></h4>
								</xsl:if>
								<p><xsl:value-of select="@camiseta"/><xsl:text> - </xsl:text><xsl:value-of select="nombre"/></p>
							</xsl:for-each>
						</article>
						
						
					</xsl:for-each>
				</main>
				
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>