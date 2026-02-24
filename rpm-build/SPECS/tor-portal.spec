Name:           tor-portal
Version:        1.0
Release:        1%{?dist}
Summary:        A shortcut to a specific Tor website
License:        MIT
URL:            http://sf7fefc34xkrqtsptpr52jt5avqkotwnvvhs5nahpx3mewqyteyvbnqd.onion
Source0:        tor-portal-1.0.tar.gz
BuildArch:      noarch
Requires:       torbrowser-launcher, libnotify

%description
This package provides a desktop entry and a launch script
to open the Tor Browser at a predefined onion address.

%prep
%setup -q

%install
mkdir -p %{buildroot}%{_bindir}
mkdir -p %{buildroot}%{_datadir}/applications
mkdir -p %{buildroot}%{_datadir}/icons/hicolor/512x512/apps

cp tor-portal %{buildroot}%{_bindir}/
cp tor-portal.desktop %{buildroot}%{_datadir}/applications/
cp tor-portal.png %{buildroot}%{_datadir}/icons/hicolor/512x512/apps/

%post
/bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null || :
/usr/bin/update-desktop-database &>/dev/null || :

%postun
if [ $1 -eq 0 ] ; then
    /bin/touch --no-create %{_datadir}/icons/hicolor &>/dev/null
    /usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
fi
/usr/bin/update-desktop-database &>/dev/null || :

%posttrans
/usr/bin/gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :

%files
%{_bindir}/tor-portal
%{_datadir}/applications/tor-portal.desktop
%{_datadir}/icons/hicolor/512x512/apps/tor-portal.png

%changelog
* Mon Feb 23 2026 Joel <joel@example.com> - 1.0-1
- Initial release
