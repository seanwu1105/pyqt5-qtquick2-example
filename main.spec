# -*- mode: python -*-

block_cipher = None


a = Analysis(['main.py'],
             pathex=['/home/seanwu/pyqt5-qtquick-example'],
             binaries=[],
             datas=[],
             hiddenimports=['PyQt5.sip', 'PyQt5.QtQuick', 'PyQt5.QtChart'],
             hookspath=['pyi_hooks/'],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='main',
          debug=False,
          strip=False,
          upx=True,
          runtime_tmpdir=None,
          console=False )
