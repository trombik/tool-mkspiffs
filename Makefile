# $FreeBSD$

PORTNAME=	tool-mkspiffs
PORTVERSION=	2.230.0
CATEGORIES=	devel

MAINTAINER=	y@trombik.org
COMMENT=	Platformio Tool to build and unpack SPIFFS images

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=	gmake compiler
USE_GITHUB=	yes
GH_TUPLE=	\
	pellepl:spiffs:f5e26c4:spiffs/spiffs \
	igrr:mkspiffs:0.2.3

MKSPIFFS_VERSION=	2.3.0
SPIFFS_VERSION=	f5e26c4
MKSPIFFS_PKGDIR=	${WRKSRC}/${PORTNAME}
MKSPIFFS_PKGFILE=	${WRKSRC}/${PORTNAME}-freebsd_${ARCH}-${PORTVERSION}.tar.gz

.include <bsd.port.pre.mk>

pre-configure:
	(cd ${WRKSRC} && ${REINPLACE_CMD} \
		-e 's|%%MKSPIFFS_VERSION%%|${MKSPIFFS_VERSION}|g' \
		-e 's|%%SPIFFS_VERSION%%|${SPIFFS_VERSION}|g' \
		-e 's|%%MAKE_CMD%%|${MAKE_CMD}|g' \
		-e 's|%%MAKE_ARGS%%|${MAKE_ARGS}|g' \
		build_all_configs.sh \
		Makefile)

do-build:
	(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${SH} build_all_configs.sh)

do-install:
	${MKDIR} ${MKSPIFFS_PKGDIR}
	${INSTALL_PROGRAM} \
		${WRKSRC}/mkspiffs-${MKSPIFFS_VERSION}-arduino-esp8266-freebsd/mkspiffs \
		${MKSPIFFS_PKGDIR}/mkspiffs_espressif8266_arduino
	${INSTALL_PROGRAM} \
		${WRKSRC}/mkspiffs-${MKSPIFFS_VERSION}-esp-idf-freebsd/mkspiffs \
		${MKSPIFFS_PKGDIR}/mkspiffs_espressif32_espidf
	${INSTALL_PROGRAM} \
		${WRKSRC}/mkspiffs-${MKSPIFFS_VERSION}-arduino-esp32-freebsd/mkspiffs \
		${MKSPIFFS_PKGDIR}/mkspiffs_espressif32_arduino
	${INSTALL_DATA} ${FILESDIR}/package.json.in ${MKSPIFFS_PKGDIR}/package.json
	${REINPLACE_CMD} -e 's|%%ARCH%%|${ARCH}|g' ${MKSPIFFS_PKGDIR}/package.json
	${RM} ${MKSPIFFS_PKGDIR}/package.json.bak

	${TAR} -C ${MKSPIFFS_PKGDIR} -czf ${MKSPIFFS_PKGFILE} .

	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${MKSPIFFS_PKGFILE} ${STAGEDIR}${DATADIR}

.include <bsd.port.post.mk>
