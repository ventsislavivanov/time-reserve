@props(['subject' => null, 'title' => null, 'buttonUrl' => null, 'buttonText' => null])

    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $subject ?? 'Notification' }}</title>
</head>
<body style="margin:0; padding:0; background:#f5f5f5; font-family:Arial, sans-serif;">

<table width="100%" cellpadding="0" cellspacing="0" style="background:#f5f5f5; padding:20px 0;">
    <tr>
        <td align="center">

            <table width="100%" cellpadding="0" cellspacing="0" style="max-width:600px; background:#ffffff; border-radius:8px; overflow:hidden;">
                <tr>
                    <td style="padding:20px;">

                        {{-- SUBJECT --}}
                        <h1 style="margin:0 0 10px 0; color:#333; font-size:24px; font-weight:bold;">
                            {{ $subject ?? 'Notification' }}
                        </h1>

                        {{-- MAIN CONTENT --}}
                        <div style="color:#444; font-size:15px; line-height:1.6;">
                            {!! $slot !!}
                        </div>

                        {{-- BUTTON --}}
                        @isset($buttonUrl)
                            <p style="margin-top:30px;">
                                <a href="{{ $buttonUrl }}"
                                   style="display:inline-block; padding:12px 20px; background:#4a90e2; color:#fff; text-decoration:none; border-radius:4px; font-size:15px;">
                                    {{ $buttonText ?? 'Open' }}
                                </a>
                            </p>
                        @endisset

                        {{-- FOOTER --}}
                        <p style="margin-top:40px; font-size:12px; color:#999;">
                            This is an automated message. Please do not reply.
                        </p>

                    </td>
                </tr>
            </table>

        </td>
    </tr>
</table>

</body>
</html>
