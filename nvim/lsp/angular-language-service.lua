return {
    cmd = {
        'ngserver',
        '--stdio',
        '--tsProbeLocations',
        '/opt/homebrew/lib/node_modules',
        '--ngProbeLocations',
        '/opt/homebrew/lib/node_modules',
    },
    root_markers = { { 'angular.json', '.angular' }, 'package.json', '.git' },
    filetypes = { 'typescript', 'html' },
}
