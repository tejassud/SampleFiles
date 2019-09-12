<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:foo="http://www.foo.org/"
	xmlns:bar="http://www.bar.org"
	xmlns:myflag="java:mypackage.MyFlag">
	<xsl:template match="/">
		<xsl:for-each select="TEI/text/body/div/div">
			<xsl:variable name="fileId" select="replace(@xml:id,'text','diplomatic')"/>
			<xsl:variable name="fileId" select="replace($fileId,'_verso','-verso')"/>
			<xsl:variable name="fileId" select="replace($fileId,'_recto','-recto')"/>
			<xsl:variable name="graphic" select="replace($fileId,'_diplomatic','')"/>
			<xsl:variable name="graphic" select="replace($graphic,'-verso','')"/>
			<xsl:variable name="graphic" select="replace($graphic,'-recto','')"/>
			<xsl:variable name="graphic" select="concat($graphic,'.jpg')"/>
			<xsl:result-document method="html" href="page_{$fileId}.html">
				<!--
				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">-->
				<html
					xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
						<meta property="og:title" content=""/>
						<meta property="og:image" content="../../data/input_data/images/thumb_fb.jpg"/>
						<title> This is a file</title>
						<link rel="stylesheet" type="text/css" href="../../css/page_data-include-diplomatic.css"/>
						<!--jQuery lib-->
						<script type="text/javascript" src="../../js/jquery_lib/jquery-latest.js"></script>
						<script type="text/javascript" src="../../js/jquery_lib/jquery-ui-latest.js"></script>
						<!--/jQuery lib-->
					</head>
					<body>
						<section id="central_wrapper">
							<div id="text_frame">
								<div id="text">
									<div id="AnnMenu">
										<div class="AnnSubmenu_Line">
											<div class="AnnSubmenu" id="content_edit" contenteditable="false" style="display: block;" >
												<span id="pgZoomVal" zoom="{@zoom}" dimTop="{@dimTop}" dimLeft="{@dimLeft}"></span>
												<xsl:for-each select="node()">
													<xsl:variable name="tag_info" select="name(.)"/>
													<xsl:if test="$tag_info = 'figure'">
														<div style="list-style:none;  background: white;" class="AnnMenuItem"
                              id="MenuItem_{@xml:id}" onclick="JumpTo('{@xml:id}')"
                              onmouseover="Highlight('{@xml:id}')" onmouseout="UnHighlight()">
															<xsl:variable name="conv">
																<xsl:if test="contains(@genre, 'conv')">
																	<xsl:value-of select="'conv'"/>
																</xsl:if>
															</xsl:variable>
															<xsl:variable name="read">
																<xsl:if test="contains(@genre, 'read')">
																	<xsl:value-of select="'read'"/>
																</xsl:if>
															</xsl:variable>
															<xsl:variable name="prose">
																<xsl:if test="contains(@genre, 'prose')">
																	<xsl:value-of select="'prose'"/>
																</xsl:if>
															</xsl:variable>
															<xsl:variable name="verse">
																<xsl:if test="contains(@genre, 'verse')">
																	<xsl:value-of select="'verse'"/>
																</xsl:if>
															</xsl:variable>
															<div class="genreBands {$conv}"></div>
															<div class="genreBands {$read}"></div>
															<div class="genreBands {$prose}"></div>
															<div class="genreBands {$verse}"></div>
															<div class="dipl">
																<span class="dipl-lineN"></span>
																<div style="max-width: 479.65px;" class="dipl-left">
																	<span class="dipl-choice_popup">
																		<span class="dipl-reg">
																			<!--<xsl:value-of select="./node"/><xsl:template match="node"><xsl:copy-of select="."></xsl:copy-of></xsl:template>-->
																			<xsl:for-each select="note">
																				<xsl:value-of select="."/>
																			</xsl:for-each>
																		</span>
																		<!-- rgb(105, 81, 58) -->
																		<span style="color:black ;" class="dipl-orig">
																			<xsl:variable name="n" select="./@n"/>
																			<span id="fig"> Figure-
																				<xsl:value-of select="$n"/>
																			</span>
																			<xsl:for-each select="node()">
																				<xsl:variable name="tag" select="name(.)"/>
																				<xsl:choose>
																					<xsl:when test="$tag = 'note'">
																						<!--<span id="helpico"></span>-->
																					</xsl:when>
																					<xsl:otherwise>
																						<xsl:value-of select="."/>
																					</xsl:otherwise>
																				</xsl:choose>
																			</xsl:for-each>
																		</span>
																	</span>
																</div>
															</div>
														</div>
														<br/>
													</xsl:if>
													<xsl:if test="$tag_info = 'surface'">
														<span class="surfaces" style="display:none" >
															<!-- from='{$fromRange}' to='{$toRange}' -->
															<xsl:copy-of select='.' />
														</span>
													</xsl:if>
													<xsl:if test="$tag_info = 'span'">
														<!-- <xsl:variable name='fromRange' select="@from"/><xsl:variable name='toRange' select="@to"/><xsl:variable name='fromRange' select="@from"/><xsl:variable name='toRange' select="@to"/> -->
														<span class="genrePartition" style="display:none" >
															<!-- from='{$fromRange}' to='{$toRange}' -->
															<xsl:copy-of select='.' />
															<!-- <xsl:copy-of select='$fromRange'></xsl:value-of>@@@ 
                                  <xsl:value-of select='$toRange'></xsl:value-of>  -->
														</span>
													</xsl:if>
													<xsl:if test="$tag_info = 'lg'">
														<div>----------------------------------------------</div>
														<div>Vertical Lines:</div>
													</xsl:if>
													<xsl:if test="$tag_info = 'l'">
														<xsl:variable name='rendition' select="@rendition"/>
														<xsl:choose>
															<xsl:when test="$rendition = 'dummy'">
																<!--                                 <div style="list-style:none; background: white;" class="AnnMenuItem"
                                  id="MenuItem_{@xml:id}" onclick="JumpTo('{@xml:id}')"
                                  onmouseover="Highlight('{@xml:id}')" onmouseout="UnHighlight()"><div class="dipl"><span class="dipl-lineN"></span><div style="max-width: 479.65px;" class="dipl-left"><span class="dipl-choice_popup"><span style="color: black;" class="dipl-orig"><xsl:value-of select="."/></span></span></div></div></div> 
 -->
															</xsl:when>
															<xsl:otherwise>
																<div style="list-style:none; background: white;" class="AnnMenuItem"
                              id="MenuItem_{@xml:id}" onclick="JumpTo('{@xml:id}')"
                              onmouseover="Highlight('{@xml:id}')" onmouseout="UnHighlight()">
																	<xsl:variable name="conv">
																		<xsl:if test="contains(@genre, 'conv')">
																			<xsl:value-of select="'conv'"/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:variable name="read">
																		<xsl:if test="contains(@genre, 'read')">
																			<xsl:value-of select="'read'"/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:variable name="prose">
																		<xsl:if test="contains(@genre, 'prose')">
																			<xsl:value-of select="'prose'"/>
																		</xsl:if>
																	</xsl:variable>
																	<xsl:variable name="verse">
																		<xsl:if test="contains(@genre, 'verse')">
																			<xsl:value-of select="'verse'"/>
																		</xsl:if>
																	</xsl:variable>
																	<div class="genreBands {$conv}"></div>
																	<div class="genreBands {$read}"></div>
																	<div class="genreBands {$prose}"></div>
																	<div class="genreBands {$verse}"></div>
																	<div class="dipl">
																		<span class="dipl-lineN"></span>
																		<div style="max-width: 479.65px;" class="dipl-left">
																			<span class="dipl-choice_popup">
																				<!--                                    <xsl:if test="./note"><span class="dipl-reg"><xsl:value-of select="./node"/><xsl:template match="node"><xsl:copy-of select="."></xsl:copy-of></xsl:template><xsl:for-each select="note"><xsl:for-each select="node()"><xsl:variable name="tag_note" select="name(.)"/><span style="font-style:italic"><xsl:copy-of select="text()"/><xsl:for-each select="hi"><xsl:variable name="color" select="./hi/@rend"/><xsl:if test="$color='i'"><span style= "font-style:italic"><xsl:value-of select="."/></span>
                                italics
                                </xsl:if></xsl:for-each><span style="font-style:italic"><xsl:value-of select="./hi[@rend = 'i']"/></span></xsl:for-each></span></xsl:if>-->
																				<!-- rgb(105, 81, 58) -->
																				<span style="color: black;" class="dipl-orig">
																					<!--<xsl:copy-of select="./text()"/><xsl:for-each select="space"><span style="line-height:{@extent}px;"></span></xsl:for-each>-->
																					<!--<xsl:value-of select="myflag:set($foo-flag, false())" />-->
																					<xsl:for-each select="node()">
																						<xsl:variable name="tag" select="name(.)"/>
																						<xsl:choose>
																							<xsl:when test="self::comment()"></xsl:when>
																							<!--<xsl:otherwise>-->
																							<!--<xsl:value-of select="."/>-->
																							<!--<xsl:choose>-->
																							<xsl:when test="$tag = 'unclear'">
																								<span style="color: black; background: grey;">
																									<xsl:for-each select="node()">
																										<xsl:variable name="tag3" select="name(.)"/>
																										<xsl:variable name="test" select="1"/>
																										<xsl:choose>
																											<xsl:when test="$tag3 = 'del'">
																												<span style="text-decoration: line-through;">
																													<xsl:value-of select="."/>
																												</span>
																											</xsl:when>
																											<xsl:when test="$tag3 = 'note'">
																												<span id="helpico" style="background-image: url('images/rsz_4notes.png'); background-repeat: no-repeat; white-space: normal;">
																													<sup>
																														<xsl:variable name="noteVal">
																															<xsl:copy-of select="node()"/>
																														</xsl:variable>
																														<span></span>
																														<!---->
																														<span class='notes' value="{$noteVal}" style=" vertical-align: super; font-size: 60%; text-decoration: blink;white-space: normal;">
                                                                                 &#160;&#160;&#160;&#160;&#160;
                                                                               </span>
																														<!---->
																														<xsl:variable name="check" select="@type"/>
																														<xsl:choose>
																															<xsl:when test="$check = 'glossary'">
																																<xsl:variable name="glossaryuniqueid" select="@target"/>
																																<span id="glossaryPopup" onclick="openGlossaryPopupBox($(this))" class="dipl-choice_popup glossarycheckbox">
																																	<span id='notePopupBox' class='dipl-reg' value="{$glossaryuniqueid}" >
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                                name="titleVal"
                                                                                                select="."
                                                                                                ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:when>
																															<xsl:otherwise>
																																<span id="notePopup" onclick="openNotePopupBox($(this))" class="dipl-choice_popup notescheckbox">
																																	<span id='notePopupBox' class='dipl-reg' >
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                                name="titleVal"
                                                                                                select="."
                                                                                                ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:otherwise>
																														</xsl:choose>
																													</sup>
																												</span>
																											</xsl:when>
																											<xsl:otherwise>
																												<xsl:value-of select="."/>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</span>
																							</xsl:when>
																							<!--<xsl:value-of select="myflag:set($foo-flag, true())" />-->
																							<!--</xsl:choose>-->
																							<!--<xsl:choose>-->
																							<xsl:when test="$tag = 'del'">
																								<span style="text-decoration: line-through;">
																									<!--<span style="background-image: linear-gradient(transparent 9px,#000000 11px,transparent 9px);">-->
																									<!--<xsl:value-of select="."/>-->
																									<xsl:for-each select="node()">
																										<xsl:variable name="tag3" select="name(.)"/>
																										<xsl:choose>
																											<xsl:when test="$tag3 = 'gap'">
																												<xsl:variable name="extent" select="@extent"/>
																												<span style="color:black;background:grey">
																													<xsl:for-each select="1 to $extent">&#9072;</xsl:for-each>
																												</span>
																											</xsl:when>
																											<xsl:when test="$tag3 = 'unclear'">
																												<span style="color: black; background: grey;">
																													<xsl:value-of select="."/>
																												</span>
																											</xsl:when>
																											<xsl:when test="$tag3 = 'note'">
																												<span id="helpico" style="background-image: url('images/rsz_4notes.png'); background-repeat: no-repeat; white-space: normal;">
																													<sup>
																														<xsl:variable name="noteVal">
																															<xsl:copy-of select="node()"/>
																														</xsl:variable>
																														<span></span>
																														<!---->
																														<span class='notes' value="{$noteVal}" style=" vertical-align: super; font-size: 60%; text-decoration: blink;white-space: normal;">
                                                                                 &#160;&#160;&#160;&#160;&#160;
                                                                               </span>
																														<!---->
																														<xsl:variable name="check" select="@type"/>
																														<xsl:choose>
																															<xsl:when test="$check = 'glossary'">
																																<xsl:variable name="glossaryuniqueid" select="@target"/>
																																<span id="glossaryPopup" onclick="openGlossaryPopupBox($(this))" class="dipl-choice_popup glossarycheckbox">
																																	<span id='notePopupBox' class='dipl-reg' value="{$glossaryuniqueid}">
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                                name="titleVal"
                                                                                                select="."
                                                                                                ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:when>
																															<xsl:otherwise>
																																<span id="notePopup" onclick="openNotePopupBox($(this))" class="dipl-choice_popup notescheckbox">
																																	<span id='notePopupBox' class='dipl-reg' >
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                                name="titleVal"
                                                                                                select="."
                                                                                                ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:otherwise>
																														</xsl:choose>
																													</sup>
																												</span>
																											</xsl:when>
																											<xsl:otherwise>
																												<xsl:value-of select="."/>
																											</xsl:otherwise>
																										</xsl:choose>
																									</xsl:for-each>
																								</span>
																								<!--<xsl:value-of select="myflag:set($foo-flag, true())" /> -->
																							</xsl:when>
																							<xsl:when test="$tag = 'note'">
																								<span id="helpico" style="background-image: url('images/rsz_4notes.png'); background-repeat: no-repeat; white-space: normal;">
																									<sup>
																										<xsl:variable name="noteVal">
																											<xsl:copy-of select="node()"/>
																										</xsl:variable>
																										<span></span>
																										<!---->
																										<span class='notes' value="{$noteVal}" style=" vertical-align: super; font-size: 60%; text-decoration: blink;white-space: normal;">
                                                                       &#160;&#160;&#160;&#160;&#160;
                                                                    </span>
																										<!---->
																										<xsl:variable name="check" select="@type"/>
																										<xsl:choose>
																											<xsl:when test="$check = 'glossary'">
																												<xsl:variable name="glossaryuniqueid" select="@target"/>
																												<span id="glossaryPopup" onclick="openGlossaryPopupBox($(this))" class="dipl-choice_popup glossarycheckbox">
																													<span id='notePopupBox' class='dipl-reg' value="{$glossaryuniqueid}">
																														<xsl:for-each select="node()">
																															<xsl:variable name="tag2" select="name(.)"/>
																															<xsl:choose>
																																<xsl:when test="$tag2 = 'title'">
																																	<xsl:variable
                                                                                  name="titleVal"
                                                                                  select="."
                                                                                  ></xsl:variable>
																																	<span style='font-style:italic;' >
																																		<xsl:value-of select="."/>
																																	</span>
																																</xsl:when>
																																<xsl:otherwise>
																																	<xsl:value-of select="."/>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																														<!--</xsl:copy-of>-->
																													</span>
																												</span>
																											</xsl:when>
																											<xsl:otherwise>
																												<span id="notePopup" onclick="openNotePopupBox($(this))" class="dipl-choice_popup notescheckbox">
																													<span id='notePopupBox' class='dipl-reg' >
																														<xsl:for-each select="node()">
																															<xsl:variable name="tag2" select="name(.)"/>
																															<xsl:choose>
																																<xsl:when test="$tag2 = 'title'">
																																	<xsl:variable
                                                                                  name="titleVal"
                                                                                  select="."
                                                                                  ></xsl:variable>
																																	<span style='font-style:italic;' >
																																		<xsl:value-of select="."/>
																																	</span>
																																</xsl:when>
																																<xsl:otherwise>
																																	<xsl:value-of select="."/>
																																</xsl:otherwise>
																															</xsl:choose>
																														</xsl:for-each>
																														<!--</xsl:copy-of>-->
																													</span>
																												</span>
																											</xsl:otherwise>
																										</xsl:choose>
																									</sup>
																								</span>
																							</xsl:when>
																							<xsl:when test="$tag = 'add'">
																								<xsl:value-of select="text()"/>
																								<xsl:for-each select="node()">
																									<xsl:variable name="tag4" select="name(.)"/>
																									<xsl:choose>
																										<xsl:when test="$tag4 = 'hi'">
																											<xsl:variable name="color" select="@rend"/>
																											<xsl:choose>
																												<xsl:when test="$color = 'pencil'">
																													<span class='hi' style="color:darkgrey">
																														<xsl:copy-of select="text()"/>
																													</span>
																												</xsl:when>
																												<xsl:when test="$color = 'underline'">
																													<span class='hi' style="text-decoration:underline">
																														<xsl:value-of select="text()"/>
																													</span>
																												</xsl:when>
																												<xsl:when test="$color = 'i'">
																													<span class='hi' style="font-style:italic">
																														<xsl:value-of select="text()"/>
																													</span>
																												</xsl:when>
																												<xsl:otherwise>
																													<span class='hi' style="color:{$color}">
																														<xsl:value-of select="text()"/>
																													</span>
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:when>
																										<xsl:when test="$tag4 = 'note'">
																											<span id="helpico" style="background-image: url('images/rsz_4notes.png'); background-repeat: no-repeat; white-space: normal;">
																												<sup>
																													<xsl:variable name="noteVal">
																														<xsl:copy-of select="node()"/>
																													</xsl:variable>
																													<span></span>
																													<!---->
																													<span class='notes' value="{$noteVal}" style=" vertical-align: super; font-size: 60%; text-decoration: blink;white-space: normal;">
                                                                       &#160;&#160;&#160;&#160;&#160;
                                                                    </span>
																													<!---->
																													<xsl:variable name="check" select="@type"/>
																													<xsl:choose>
																														<xsl:when test="$check = 'glossary'">
																															<xsl:variable name="glossaryuniqueid" select="@target"/>
																															<span id="glossaryPopup" onclick="openGlossaryPopupBox($(this))" class="dipl-choice_popup glossarycheckbox">
																																<span id='notePopupBox' class='dipl-reg' value="{$glossaryuniqueid}">
																																	<xsl:for-each select="node()">
																																		<xsl:variable name="tag2" select="name(.)"/>
																																		<xsl:choose>
																																			<xsl:when test="$tag2 = 'title'">
																																				<xsl:variable
                                                                                    name="titleVal"
                                                                                    select="."
                                                                                    ></xsl:variable>
																																				<span style='font-style:italic;' >
																																					<xsl:value-of select="."/>
																																				</span>
																																			</xsl:when>
																																			<xsl:otherwise>
																																				<xsl:value-of select="."/>
																																			</xsl:otherwise>
																																		</xsl:choose>
																																	</xsl:for-each>
																																	<!--</xsl:copy-of>-->
																																</span>
																															</span>
																														</xsl:when>
																														<xsl:otherwise>
																															<span id="notePopup" onclick="openNotePopupBox($(this))" class="dipl-choice_popup notescheckbox">
																																<span id='notePopupBox' class='dipl-reg' >
																																	<xsl:for-each select="node()">
																																		<xsl:variable name="tag2" select="name(.)"/>
																																		<xsl:choose>
																																			<xsl:when test="$tag2 = 'title'">
																																				<xsl:variable
                                                                                    name="titleVal"
                                                                                    select="."
                                                                                    ></xsl:variable>
																																				<span style='font-style:italic;' >
																																					<xsl:value-of select="."/>
																																				</span>
																																			</xsl:when>
																																			<xsl:otherwise>
																																				<xsl:value-of select="."/>
																																			</xsl:otherwise>
																																		</xsl:choose>
																																	</xsl:for-each>
																																	<!--</xsl:copy-of>-->
																																</span>
																															</span>
																														</xsl:otherwise>
																													</xsl:choose>
																												</sup>
																											</span>
																										</xsl:when>
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:when>
																							<xsl:when test="$tag = 'gap'">
																								<!--<xsl:copy-of select="."/>-->
																								<span id="gapblock">
																									<xsl:variable name="extent" select="@extent"/>
																									<span style="color:black;background:grey">
																										<xsl:for-each select="1 to $extent">&#9072;</xsl:for-each>
																									</span>
																								</span>
																							</xsl:when>
																							<xsl:when test="$tag = 'source'">
																								<!--<xsl:copy-of select="."/>-->
																								<span >
																									<xsl:for-each select="node()">
																										<xsl:variable name="tag6" select="name(.)"/>
																										<xsl:choose>
																											<xsl:when test="$tag6 = 'note'">
																												<span id="helpico" style="background-image: url('images/rsz_4notes.png'); background-repeat: no-repeat; white-space: normal;">
																													<sup>
																														<xsl:variable name="noteVal">
																															<xsl:copy-of select="node()"/>
																														</xsl:variable>
																														<span></span>
																														<!---->
																														<span class='notes' value="{$noteVal}" style=" vertical-align: super; font-size: 60%; text-decoration: blink;white-space: normal;">
                                                                             &#160;&#160;&#160;&#160;&#160;
                                                                           </span>
																														<!---->
																														<xsl:variable name="check" select="@type"/>
																														<xsl:choose>
																															<xsl:when test="$check = 'glossary'">
																																<xsl:variable name="glossaryuniqueid" select="@target"/>
																																<span id="glossaryPopup" onclick="openGlossaryPopupBox($(this))" class="dipl-choice_popup glossarycheckbox">
																																	<span id='notePopupBox' class='dipl-reg' value="{$glossaryuniqueid}">
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                            name="titleVal"
                                                                                            select="."
                                                                                            ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:when>
																															<xsl:otherwise>
																																<span id="notePopup" onclick="openNotePopupBox($(this))" class="dipl-choice_popup notescheckbox">
																																	<span id='notePopupBox' class='dipl-reg' >
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                            name="titleVal"
                                                                                            select="."
                                                                                            ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:otherwise>
																														</xsl:choose>
																													</sup>
																												</span>
																											</xsl:when>
																											<xsl:otherwise>
																												<xsl:value-of select="."/>
																											</xsl:otherwise>
																											<!-- <xsl:otherwise>     -->
																										</xsl:choose>
																									</xsl:for-each>
																								</span>
																							</xsl:when>
																							<xsl:when test="$tag = 'lang'">
																								<!--<xsl:copy-of select="."/>-->
																								<span >
																									<xsl:for-each select="node()">
																										<xsl:variable name="tag6" select="name(.)"/>
																										<xsl:choose>
																											<xsl:when test="$tag6 = 'note'">
																												<span id="helpico" style="background-image: url('images/rsz_4notes.png'); background-repeat: no-repeat; white-space: normal;">
																													<sup>
																														<xsl:variable name="noteVal">
																															<xsl:copy-of select="node()"/>
																														</xsl:variable>
																														<span></span>
																														<!---->
																														<span class='notes' value="{$noteVal}" style=" vertical-align: super; font-size: 60%; text-decoration: blink;white-space: normal;">
                                                                             &#160;&#160;&#160;&#160;&#160;
                                                                           </span>
																														<!---->
																														<xsl:variable name="check" select="@type"/>
																														<xsl:choose>
																															<xsl:when test="$check = 'glossary'">
																																<xsl:variable name="glossaryuniqueid" select="@target"/>
																																<span id="glossaryPopup" onclick="openGlossaryPopupBox($(this))" class="dipl-choice_popup glossarycheckbox">
																																	<span id='notePopupBox' class='dipl-reg' value="{$glossaryuniqueid}">
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                              name="titleVal"
                                                                                              select="."
                                                                                              ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:when>
																															<xsl:otherwise>
																																<span id="notePopup" onclick="openNotePopupBox($(this))" class="dipl-choice_popup notescheckbox">
																																	<span id='notePopupBox' class='dipl-reg' >
																																		<xsl:for-each select="node()">
																																			<xsl:variable name="tag2" select="name(.)"/>
																																			<xsl:choose>
																																				<xsl:when test="$tag2 = 'title'">
																																					<xsl:variable
                                                                                            name="titleVal"
                                                                                            select="."
                                                                                            ></xsl:variable>
																																					<span style='font-style:italic;' >
																																						<xsl:value-of select="."/>
																																					</span>
																																				</xsl:when>
																																				<xsl:otherwise>
																																					<xsl:value-of select="."/>
																																				</xsl:otherwise>
																																			</xsl:choose>
																																		</xsl:for-each>
																																		<!--</xsl:copy-of>-->
																																	</span>
																																</span>
																															</xsl:otherwise>
																														</xsl:choose>
																													</sup>
																												</span>
																											</xsl:when>
																											<xsl:otherwise>
																												<xsl:value-of select="."/>
																											</xsl:otherwise>
																											<!-- <xsl:otherwise>     -->
																										</xsl:choose>
																									</xsl:for-each>
																								</span>
																							</xsl:when>
																							<!--</xsl:choose>-->
																							<!--<xsl:choose>-->
																							<xsl:when test="$tag = 'hi'">
																								<xsl:variable name="color" select="@rend"/>
																								<xsl:choose>
																									<xsl:when test="$color = 'pencil'">
																										<span class='hi' style="color:darkgrey">
																											<xsl:copy-of select="text()"/>
																										</span>
																									</xsl:when>
																									<xsl:when test="$color = 'underline'">
																										<span class='hi' style="text-decoration:underline">
																											<xsl:value-of select="text()"/>
																										</span>
																									</xsl:when>
																									<xsl:when test="$color = 'i'">
																										<span class='hi' style="font-style:italic">
																											<xsl:value-of select="text()"/>
																										</span>
																									</xsl:when>
																									<xsl:otherwise>
																										<span class='hi' style="color:{$color}">
																											<xsl:value-of select="text()"/>
																										</span>
																									</xsl:otherwise>
																								</xsl:choose>
																								<!-- </xsl:otherwise>     -->
																								<xsl:for-each select="node()">
																									<xsl:variable name="tag5" select="name(.)"/>
																									<xsl:choose>
																										<xsl:when test="$tag5 = 'note'">
																											<span id="helpico" style="background-image: url('images/rsz_4notes.png'); background-repeat: no-repeat; white-space: normal;">
																												<sup>
																													<xsl:variable name="noteVal">
																														<xsl:copy-of select="node()"/>
																													</xsl:variable>
																													<span></span>
																													<!---->
																													<span class='notes' value="{$noteVal}" style=" vertical-align: super; font-size: 60%; text-decoration: blink;white-space: normal;">
                                                                       &#160;&#160;&#160;&#160;&#160;
                                                                     </span>
																													<!---->
																													<xsl:variable name="check" select="@type"/>
																													<xsl:choose>
																														<xsl:when test="$check = 'glossary'">
																															<xsl:variable name="glossaryuniqueid" select="@target"/>
																															<span id="glossaryPopup" onclick="openGlossaryPopupBox($(this))" class="dipl-choice_popup glossarycheckbox">
																																<span id='notePopupBox' class='dipl-reg' value="{$glossaryuniqueid}">
																																	<xsl:for-each select="node()">
																																		<xsl:variable name="tag2" select="name(.)"/>
																																		<xsl:choose>
																																			<xsl:when test="$tag2 = 'title'">
																																				<xsl:variable
                                                                                        name="titleVal"
                                                                                        select="."
                                                                                        ></xsl:variable>
																																				<span style='font-style:italic;' >
																																					<xsl:value-of select="."/>
																																				</span>
																																			</xsl:when>
																																			<xsl:otherwise>
																																				<xsl:value-of select="."/>
																																			</xsl:otherwise>
																																		</xsl:choose>
																																	</xsl:for-each>
																																	<!--</xsl:copy-of>-->
																																</span>
																															</span>
																														</xsl:when>
																														<xsl:otherwise>
																															<span id="notePopup" onclick="openNotePopupBox($(this))" class="dipl-choice_popup notescheckbox">
																																<span id='notePopupBox' class='dipl-reg' >
																																	<xsl:for-each select="node()">
																																		<xsl:variable name="tag2" select="name(.)"/>
																																		<xsl:choose>
																																			<xsl:when test="$tag2 = 'title'">
																																				<xsl:variable
                                                                                      name="titleVal"
                                                                                      select="."
                                                                                      ></xsl:variable>
																																				<span style='font-style:italic;' >
																																					<xsl:value-of select="."/>
																																				</span>
																																			</xsl:when>
																																			<xsl:otherwise>
																																				<xsl:value-of select="."/>
																																			</xsl:otherwise>
																																		</xsl:choose>
																																	</xsl:for-each>
																																	<!--</xsl:copy-of>-->
																																</span>
																															</span>
																														</xsl:otherwise>
																													</xsl:choose>
																												</sup>
																											</span>
																										</xsl:when>
																										<!-- <xsl:otherwise>     -->
																									</xsl:choose>
																								</xsl:for-each>
																							</xsl:when>
																							<!--<xsl:value-of select="myflag:set($foo-flag, true())" />-->
																							<!--</xsl:choose>-->
																							<xsl:otherwise>
																								<xsl:copy-of select="."/>
																							</xsl:otherwise>
																						</xsl:choose>
																						<xsl:choose>
																							<xsl:when test="$tag = 'space'">
																								<span style="padding-left:{@extent}px;"></span>
																							</xsl:when>
																							<!--<xsl:value-of select="myflag:set($foo-flag, true())" />-->
																						</xsl:choose>
																						<xsl:choose>
																							<xsl:when test="$tag = 'vertical'">
																								<span style="padding-top:{@extent}px;"></span>
																							</xsl:when>
																							<!--<xsl:value-of select="myflag:set($foo-flag, true())" />-->
																						</xsl:choose>
																					</xsl:for-each>
																				</span>
																			</span>
																		</div>
																	</div>
																</div>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:if>
												</xsl:for-each>
												<!--</table>-->
											</div>
										</div>
									</div>
									<div id="areaAnnotations">
										<div id="realImageWidth" style="display:none;">1200px</div>
										<xsl:for-each select="l">
											<!--<p><xsl:value-of select="./@facs" /></p>-->
											<xsl:variable name="facs" select="./@facs"/>
											<xsl:variable name="facs2" select="substring-after($facs, '#')"/>
											<!--<xsl:value-of select="/*/*/*/*/zone[@xml:id=$facs2]"/>-->
											<xsl:variable name="origwidth" select="/*/*/*/*/graphic[@url = $graphic]/@width"/>
											<xsl:variable name="origheight" select="/*/*/*/*/graphic[@url = $graphic]/@height"/>
											<!-- <xsl:variable name="origwidth" select="581"/> -->
											<!-- <xsl:variable name="origheight" select="483"/> -->
											<xsl:variable name="naturalwidth" select="2154"/>
											<xsl:variable name="naturalheight" select="1791"/>
											<xsl:variable name="wratio" select="$naturalwidth div $origwidth"/>
											<xsl:variable name="hratio" select="$naturalheight div $origheight"/>
											<xsl:variable name="ulx" select="/*/*/*/*/zone[@xml:id = $facs2]/@ulx"/>
											<xsl:variable name="uly" select="/*/*/*/*/zone[@xml:id = $facs2]/@uly"/>
											<xsl:variable name="lrx" select="/*/*/*/*/zone[@xml:id = $facs2]/@lrx"/>
											<xsl:variable name="lry" select="/*/*/*/*/zone[@xml:id = $facs2]/@lry"/>
											<xsl:variable name="width" select="$lrx - $ulx"/>
											<xsl:variable name="height" select="$lry - $uly"/>
											<!-- <xsl:variable name="ratio" select="0.558"/> -->
											<!--                                             <xsl:variable name="ratio" select="1203 div replace($origwidth,'px','')"/><xsl:variable name="imgTop" select="replace($origheight,'px','') div 18.3"/>
 -->
											<!-- <xsl:variable name="imgLeft" select="10"/> -->
											<!--                                             <xsl:variable name="ulx" select="$ulx * $ratio"/><xsl:variable name="uly" select="($uly * $ratio)+$imgTop"/><xsl:variable name="width" select="$width * $ratio"/><xsl:variable name="height" select="$height * $ratio"/>

 -->
											<div id="Area_{@xml:id}" class="Area" onclick="ShowAnn('{@xml:id}')"
                                                 onmouseover="Highlight('{@xml:id}')" onmouseout="UnHighlight()"
                                                 style="position: absolute; hratio:{$hratio}; left: {$ulx}px; top: {$uly}px; width: {$width}px; height:{$height}px ; origwidth: {$origwidth}; origheight:{replace($origheight,'px','')}; padding: 0; cursor: pointer; font-size: 144px; text-align: center; vertical-align: middle; display: none; overflow: hidden;"
                                            ></div>
										</xsl:for-each>
									</div>
								</div>
							</div>
						</section>
					</body>
				</html>
			</xsl:result-document>
			<!--<td><xsl:value-of select="@xml:id"/><xsl:for-each select="l"><xsl:value-of select="."/></xsl:for-each></td><td><xsl:value-of select="note"/></td>-->
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
