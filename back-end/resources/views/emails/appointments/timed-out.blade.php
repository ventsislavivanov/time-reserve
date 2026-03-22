<x-email-layout
    :subject="'Appointment Timed Out'"
    :title="'Your appointment was not confirmed in time'"
    :buttonUrl="config('app.frontend_url') . '/our-team'"
    buttonText="Book a new appointment"
>

    <p>Hello {{ $client->name }},</p>

    <p>Your appointment could not be confirmed in time and has been automatically cancelled.</p>

    <p><strong>Service:</strong> {{ $appointment->service->name }}</p>
    <p><strong>Worker:</strong> {{ $appointment->worker->name }}</p>
    <p><strong>Date:</strong> {{ $appointment->starts_at->format('d M Y') }}</p>
    <p><strong>Time:</strong> {{ $appointment->starts_at->format('H:i') }} – {{ $appointment->ends_at->format('H:i') }}</p>

    <p>You can book a new appointment whenever it is convenient for you.</p>

</x-email-layout>
