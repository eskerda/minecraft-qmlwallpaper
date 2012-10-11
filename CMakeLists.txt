find_package(KDE4 REQUIRED)

install(DIRECTORY contents DESTINATION ${DATA_INSTALL_DIR}/plasma/wallpapers/org.kde.pixelskywallpaper)
install(FILES metadata.desktop DESTINATION ${DATA_INSTALL_DIR}/plasma/wallpapers/org.kde.pixelskywallpaper)
