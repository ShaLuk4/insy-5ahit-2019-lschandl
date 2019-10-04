<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <magazine>
            <xsl:apply-templates select="/report">

            </xsl:apply-templates>
        </magazine>
    </xsl:template>
    <xsl:template match="report">
        <report>
            <head>
                <xsl:for-each select="authors/*">
                    <author>
                        <xsl:if test="./name">
                            <xsl:value-of select="./name"/>
                        </xsl:if>
                        <xsl:value-of
                                select="concat(./first-name/text(), ' ', ./middle-name/text(), ' ', ./last-name/text())"/>
                    </author>
                </xsl:for-each>
                <pages>
                    <xsl:value-of select="description/pages"/>
                </pages>
                <url>
                    <xsl:value-of select="description/homepage"/>
                </url>
            </head>
            <body>
                <authors>
                    <xsl:for-each select="description/authors/node()">
                        <xsl:choose>
                            <xsl:when test="self::aref">
                                <xsl:variable name="id">
                                    <xsl:value-of select="@id"/>
                                </xsl:variable>
                                <xsl:variable name="author" select="/report/authors/*[@id = $id]"/>
                                <!--xsl:value-of select="$author"/-->
                                <xsl:if test="$author/name">
                                    <xsl:value-of select="$author/name"/>
                                </xsl:if>
                                <xsl:value-of
                                        select="concat($author/first-name, ' ', $author/middle-name, ' ', $author/last-name)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </authors>
                <content>
                    <xsl:value-of select="content"/>
                </content>
            </body>
        </report>
    </xsl:template>

</xsl:stylesheet>