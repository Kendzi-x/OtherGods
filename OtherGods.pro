# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = OtherGods

CONFIG += sailfishapp

SOURCES += src/OtherGods.cpp

OTHER_FILES += qml/OtherGods.qml \
    qml/cover/CoverPage.qml \
    rpm/OtherGods.changes.in \
    rpm/OtherGods.spec \
    rpm/OtherGods.yaml \
    translations/*.ts \
    OtherGods.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/OtherGods-de.ts

HEADERS +=

DISTFILES += \
    qml/pages/Map.qml \
    qml/pages/Spell.qml \
    qml/pages/Possessed.qml \
    qml/pages/Characters.qml \
    qml/pages/GG.qml \
    qml/pages/Guard.qml \
    qml/pages/Counter.js \
    qml/pages/CounterQ.qml \
    qml/pages/Menu.qml \
    qml/pages/Developers.qml \
    qml/pages/SpellField.qml \
    qml/pages/TheBadEnd.qml \
    qml/pages/Victory.qml \
    qml/pages/Dialog.qml \
    qml/pages/Animetion.qml \
    qml/pages/Battle2.qml \
    qml/pages/Battle1.qml

