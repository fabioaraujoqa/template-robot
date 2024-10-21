from Browser import Browser

browser = None

def set_browser_instance(browser_instance):
    global browser
    browser = browser_instance

def executar_javascript(script):
    if browser is None:
        raise ValueError("Browser instance is not set.")
    return browser.evaluate_javascript(script)