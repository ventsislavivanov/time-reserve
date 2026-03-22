<x-email-layout
    :subject="'Appointment Declined'"
    :title="'Your appointment was declined'"
    :buttonUrl="config('app.frontend_url') . '/our-team'"
    buttonText="Book another appointment"
>

    <p>Hello {{ $client->name }},</p>

    <p>Unfortunately, your appointment request was declined.</p>

    <p><strong>Service:</strong> {{ $appointment->service->name }}</p>
    <p><strong>Worker:</strong> {{ $appointment->worker->name }}</p>
    <p><strong>Date:</strong> {{ $appointment->starts_at->format('d M Y') }}</p>
    <p><strong>Time:</strong> {{ $appointment->starts_at->format('H:i') }} – {{ $appointment->ends_at->format('H:i') }}</p>
    <p><strong>Reason:</strong> {{ $appointment->reason }} </p>

    <p>You can choose another time or service using the link below.</p>

</x-email-layout>
