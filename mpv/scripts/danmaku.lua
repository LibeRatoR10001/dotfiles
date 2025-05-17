-- bilibili-danmaku.lua
local utils = require('mp.utils')
local msg = require('mp.msg')
local xml_path = nil
local ass_path = nil

-- 检查当前播放文件是否是 B 站视频
local function is_bilibili_url(path)
	return path and (path:match('bilibili%.com') or path:match('^bv') or path:match('^BV'))
end

-- 调用 yt-dlp 获取弹幕并转换为 ASS
local function fetch_danmaku()
	local url = mp.get_property('path')
	if not is_bilibili_url(url) then
		return
	end
	local bv = url:gsub('^https://www.bilibili.com/video/', '')
	msg.info('检测到 B 站视频，尝试获取弹幕...')

	-- 生成临时文件名
	local tmp_dir = os.getenv('TMPDIR') or '/tmp'
	local xml = bv .. '.danmaku.xml'
	local ass = bv .. '.ass'
	local danmaku_path = utils.join_path(tmp_dir, bv)
	xml_path = utils.join_path(tmp_dir, xml)
	ass_path = utils.join_path(tmp_dir, ass)

	-- 通过 yt-dlp 下载弹幕（XML 格式）
	local args = {
		'yt-dlp',
		'--cookies-from-browser',
		'firefox',
		'--skip-download',
		'--write-subs',
		'--sub-langs',
		'danmaku',
		-- "--sub-format",
		-- "xml",
		'--output',
		danmaku_path,
		url,
	}
	xml_path:gsub('%.danmaku%.xml$', '') -- 去除后缀，yt-dlp 会自动添加
	local result = utils.subprocess({ args = args })
	-- 检查弹幕是否下载成功
	if result.status ~= 0 then
		msg.error('下载弹幕失败:', result.stderr)
		return
	end

	-- 将 XML 弹幕转换为 ASS 格式（使用 danmaku2ass 工具）
	local convert_args = {
		'danmaku2ass',
		'-s',
		'1920x1080',
		'-fn',
		'Maple Mono NF CN',
		'-fs',
		'45',
		'-a',
		'0.8',
		'-o',
		ass_path,
		xml_path,
	}
	local convert_result = utils.subprocess({ args = convert_args })

	if convert_result.status ~= 0 then
		msg.error('弹幕转换失败:', convert_result.stderr)
		return
	end

	-- 自动加载 ASS 弹幕
	mp.commandv('sub-add', ass_path, 'auto', '弹幕')
	msg.info('弹幕已加载:', ass_path)
end

-- 播放结束处理
local function clean_temp()
	if xml_path then
		os.remove(xml_path)
		msg.info('已删除xml弹幕文件')
		xml_path = nil
	end
	if ass_path then
		os.remove(ass_path)
		msg.info('已删除ass弹幕文件')
		ass_path = nil
	end
end

-- 在播放开始前触发弹幕下载
mp.add_hook('on_load', 50, fetch_danmaku)
-- 播放结束删除临时文件
mp.add_hook('on_unload', 50, clean_temp)
