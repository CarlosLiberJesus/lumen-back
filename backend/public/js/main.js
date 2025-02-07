if (document.documentElement) {
    startTheme();
    const toggleTheme = document.getElementById("theme-switcher");
    if (toggleTheme) {
        toggleTheme.addEventListener("click", () => {
            const currentTheme =
                document.documentElement.getAttribute("data-bs-theme");
            const newTheme = currentTheme === "light" ? "dark" : "light";
            const icon = document.getElementById("theme-switcher").firstChild;
            const logo = document.querySelector("#logos img.d-lg-block");
            const mLogo = document.querySelector("#logos img.d-lg-none");

            if (newTheme === "light") {
                icon.classList.remove("bi-moon");
                icon.classList.add("bi-sun");
                if (logo) logo.setAttribute("src", "img/logos/logo-white.png");
                if (mLogo) mLogo.setAttribute("src", "img/logos/ico-white.png");
            } else {
                icon.classList.remove("bi-sun");
                icon.classList.add("bi-moon");
                if (logo)
                    logo.setAttribute("src", "img/logos/logo-dark-white.png");
                if (mLogo)
                    mLogo.setAttribute("src", "img/logos/ico-dark-white.png");
            }
            localStorage.setItem("theme_value", newTheme);
            document.documentElement.setAttribute("data-bs-theme", newTheme);
        });
    }
}

function startTheme() {
    const defaultThemeMode = "system";
    const lsKey = "theme_value";
    var themeMode = localStorage.getItem(lsKey);
    if (!themeMode) {
        themeMode = defaultThemeMode;
    }

    const icon = document.getElementById("theme-switcher").firstChild;
    const logo = document.querySelector("#logos img.d-lg-block");
    const mLogo = document.querySelector("#logos img.d-lg-none");
    if (themeMode === "light") {
        icon.classList.remove("bi-moon");
        icon.classList.add("bi-sun");
        if (logo) logo.setAttribute("src", "img/logos/logo-white.png");
        if (mLogo) mLogo.setAttribute("src", "img/logos/ico-white.png");
    } else {
        icon.classList.remove("bi-sun");
        icon.classList.add("bi-moon");
        if (logo) logo.setAttribute("src", "img/logos/logo-dark-white.png");
        if (mLogo) mLogo.setAttribute("src", "img/logos/ico-dark-white.png");
    }
    if (themeMode === "system") {
        themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches
            ? "dark"
            : "light";
    }
    localStorage.setItem(lsKey, themeMode);
    document.documentElement.setAttribute("data-bs-theme", themeMode);
}
