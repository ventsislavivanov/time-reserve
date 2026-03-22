<x-email-layout
    :subject="'Appointment Confirmed'"
    :title="'Your appointment was confirmed'"
    :buttonUrl="config('app.frontend_url') . '/service'"
    buttonText="Book a new appointment"
>

    <p>Hello {{ $client->name }},</p>

    <p>Your appointment has been successfully confirmed. Thank you for your reservation.</p>

    <p><strong>Service:</strong> {{ $appointment->service->name }}</p>
    <p><strong>Worker:</strong> {{ $appointment->worker->name }}</p>
    <p><strong>Date:</strong> {{ $appointment->starts_at->format('d M Y') }}</p>
    <p><strong>Time:</strong> {{ $appointment->starts_at->format('H:i') }} – {{ $appointment->ends_at->format('H:i') }}</p>

    <p>Take a look at our other services and book your next appointment anytime.</p>

</x-email-layout>
