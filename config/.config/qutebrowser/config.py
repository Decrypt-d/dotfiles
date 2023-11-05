config = config # Config API
c = c           # Config container

# Disable loading of autoconfig.yml
config.load_autoconfig(False)

# * Notes
# ** Probably Will Be Useful
# - click-element
# - ;; for command chaining
# - content.user_stylesheets

# Helper functions
def bind(key, command, mode):
    config.bind(key, command, mode=mode)

def unbind(key,mode):
    config.unbind(key, mode=mode)

def nmap(key, command):
    bind(key, command, 'normal')

def cmap(key, command):
    bind(key, command, 'command')

def run_for_all_mode(func, *args):
    available_mode_list = ['normal', 'caret', 'command', 'hint', 'insert', 'passthrough', 'prompt', 'register']
    for mode in available_mode_list:
        func(*args, mode=mode)

# Theme
config.set("colors.webpage.darkmode.enabled", True) # Not too sure why this causes insane lag and halo effect on video
config.set('zoom.default', '130%')

# Media
c.content.autoplay = False

# Mode configuration
run_for_all_mode(bind, '<Alt-l>', 'mode-leave')
nmap('<Alt-r>', 'config-source')

## Default landing page
c.url.start_pages = ['https://google.com']

## Theme
# Webpage color
c.colors.webpage.bg = 'black'

## Font configurations
# Font size
c.fonts.default_size = '15pt'

## Default Search Engine
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    'am': 'https://www.amazon.com/s?k={}',
    'yt': 'https://www.youtube.com/results?search_query={}',
}

# Tabs
c.tabs.background = True
nmap('gt', 'tab-next')
nmap('gT', 'tab-prev')
nmap('tc', 'tab-close')
nmap('ts', 'tab-give')

# Search
nmap('o', 'cmd-set-text -s :open')
nmap('O', 'cmd-set-text -s :open --tab')
nmap('yt', 'cmd-set-text --space :open yt ')
nmap('yT', 'cmd-set-text --space :open --tab yt ')
nmap('YT', 'cmd-set-text --space :open --tab yt ')
nmap('am', 'cmd-set-text --space :open am ')
nmap('aM', 'cmd-set-text --space :open --tab am ')
nmap('AM', 'cmd-set-text --space :open --tab am ')

# Forward/Backward Movements
nmap('H', 'back')
nmap('L', 'forward')
nmap('h', 'scroll left')
nmap('l', 'scroll right')

# Keys unmapping
config.unbind("gf")
config.unbind("d", 'normal')

run_for_all_mode(bind, '<Ctrl-f>', 'cmd-set-text /')
