# Defined in /var/folders/s7/2ypm2j2j7m1_71jb9wx02tsh0000gq/T//fish.SynzUh/fish_right_prompt.fish @ line 2
function fish_right_prompt
	set -l status_copy $status
    set -l status_code $status_copy

    set -l color_normal (set_color normal)
    set -l color_error (set_color $fish_color_error)
    set -l color "$color_normal"

    switch "$status_copy"
        case 0 "$__mono_status_last"
            set status_code
    end

    set -g __mono_status_last $status_copy

    if test "$status_copy" -ne 0
        set color "$color_error"
    end

    if set -l job_id (last_job_id)
        echo -sn "$color%$job_id$color_normal "
    end

    if test ! -z "$status_code"
        echo -sn "$color$status_code$color_normal "
    end

    if test ! -z "$VIRTUAL_ENV"
      set venv (basename $VIRTUAL_ENV)
    end

    if test "$CMD_DURATION" -gt 250
        set -l duration (echo $CMD_DURATION | humanize_duration)
        echo -sn "$color$duration$color_normal "
		if test "$CMD_DURATION" -gt 5000
	    	if which osascript >/dev/null
	    		osascript -e 'display notification "Command '$history[1]' finished after '$duration'" with title "Command finished"'
	    	end
	    end
    else
        echo -sn "$color$venv$color_normal "
    end
end
