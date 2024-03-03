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
				
				<main class="principal">
					<!-- Recorremos los articulos de la tienda y mostramos los datos correspondientes-->
					<xsl:for-each select="tienda/articulo">
						
						<article>
							<section>
								<img class="articulo" src="../img/{@foto}"/>			
							</section>
							<section>
								<h2><xsl:value-of select="precio"/></h2>
								<h3>Comentarios:<xsl:value-of select='count(comentarios)' /></h3>
								
								<ul>
									<xsl:for-each select="comentarios">
										<li><xsl:value-of select="@fecha"/><xsl:text> </xsl:text><xsl:value-of select="."/></li>
									</xsl:for-each>
								</ul>
								
							</section>
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