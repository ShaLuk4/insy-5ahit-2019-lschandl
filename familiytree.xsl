<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <familiytree>
            <xsl:apply-templates select="//person[not(parents) and birthday]"/>
        </familiytree>
    </xsl:template>

    <xsl:template match="person">
        <person>
            <name>
                <xsl:value-of select="name/text()"/>
            </name>
            <child>
                <xsl:for-each select="ancestor::person[1]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </child>
        </person>
    </xsl:template>
</xsl:stylesheet>