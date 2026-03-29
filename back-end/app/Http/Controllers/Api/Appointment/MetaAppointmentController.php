<?php

namespace App\Http\Controllers\Api\Appointment;

use App\AppointmentStatus;
use App\Http\Controllers\Controller;
use OpenApi\Attributes as OA;

class MetaAppointmentController extends Controller
{
    #[OA\Get(
        path: '/api/appointment-statuses',
        description: 'Returns all possible appointment statuses for dropdowns and filters.',
        summary: 'Get all appointment statuses',
        security: [['sanctum' => []]],
        tags: ['Appointments'],
        responses: [
            new OA\Response(
                response: 200,
                description: 'List of statuses',
                content: new OA\JsonContent(
                    type: 'array',
                    items: new OA\Items(
                        properties: [
                            new OA\Property(property: 'value', type: 'string'),
                            new OA\Property(property: 'label', type: 'string'),
                        ]
                    )
                )
            )
        ]
    )]
    public function statuses()
    {
        return cache()->rememberForever('appointment_statuses', function () {
            return collect(AppointmentStatus::cases())
                ->map(fn($case) => [
                    'value' => $case->value,
                    'label' => ucfirst(str_replace('_', ' ', $case->value)),
                ]);
        });
    }

}
