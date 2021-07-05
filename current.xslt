<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:element name="rss">
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="channel">
        <xsl:element name="channel">
             <xsl:element name="title">
                <xsl:value-of select="title" />
            </xsl:element>
             <xsl:element name="link">
                <xsl:value-of select="link" />
            </xsl:element>
             <xsl:element name="description">
                <xsl:value-of select="description" />
            </xsl:element>
        </xsl:element> 
        <xsl:apply-templates select="item" />
    </xsl:template>

    <xsl:template match="item">
        <xsl:element name="item">
            <xsl:apply-templates select="title" />
            <xsl:apply-templates select="category" />
            <xsl:element name="link">
                <xsl:value-of select="link" />
            </xsl:element>
            <xsl:element name="description">
                <xsl:value-of select="description" />
            </xsl:element>
            <xsl:element name="pubDate">
                <xsl:value-of select="pubDate" />
            </xsl:element>
            <xsl:element name="guid">
                <xsl:value-of select="guid" />
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="category">
        <xsl:element name="category">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <xsl:template match="title">
        <xsl:element name="title">
            <xsl:call-template name="removeSquareBracketText">
                <xsl:with-param name="text">
                    <xsl:value-of select="." />
                </xsl:with-param>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xsl:template name="removeSquareBracketText">
        <xsl:param name="text" />
        <xsl:variable name="substring">
            <xsl:value-of select="substring-before($text,'[')" />
            <xsl:value-of select="substring-after($text,']')" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="string-length($substring) &gt; 0">
                <xsl:value-of select="$substring" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>

