<x-email-layout
    subject="Appointment Expired"
    title="Your appointment has expired"
    :buttonUrl="config('app.frontend_url') . '/our-team'"
    buttonText="Book a new appointment"
>

    <p>Hello {{ $client->name }},</p>

    <p>Your appointment was not confirmed and the scheduled time has already passed.</p>

    <p><strong>Service:</strong> {{ $appointment->service->name }}</p>
    <p><strong>Worker:</strong> {{ $appointment->worker->name }}</p>
    <p><strong>Date:</strong> {{ $appointment->starts_at->format('d M Y') }}</p>
    <p><strong>Time:</strong> {{ $appointment->starts_at->format('H:i') }} – {{ $appointment->ends_at->format('H:i') }}</p>

    <p>Feel free to book a new appointment whenever it suits you.</p>

</x-email-layout>
