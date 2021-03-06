local fs = require 'bee.filesystem'

ROOT = fs.current_path()
LANG = 'en-US'

package.path = (ROOT / 'src' / '?.lua'):string()
     .. ';' .. (ROOT / 'src' / '?' / 'init.lua'):string()
     .. ';' .. (ROOT / 'test' / '?.lua'):string()
     .. ';' .. (ROOT / 'test' / '?' / 'init.lua'):string()

log = require 'log'
log.init(ROOT, ROOT / 'log' / 'test.log')
log.debug('测试开始')
ac = {}

require 'utility'
require 'global_protect'
require 'build_package'

local function main()
    local function test(name)
        local clock = os.clock()
        print(('测试[%s]...'):format(name))
        require(name)
        print(('测试[%s]用时[%.3f]'):format(name, os.clock() - clock))
    end

    test 'core'
    test 'definition'
    test 'rename'
    test 'highlight'
    test 'references'
    test 'diagnostics'
    test 'type_inference'
    test 'find_lib'
    test 'hover'
    test 'completion'
    test 'signature'
    test 'document_symbol'
    test 'crossfile'
    test 'full'

    print('测试完成')
end

main()

log.debug('测试完成')
