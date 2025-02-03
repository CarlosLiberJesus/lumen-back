<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Mail\BewhyMailable;
use Exception;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Mail\PendingMail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

final class EmailController extends Controller
{
    public function templateFooterEmail(Request $request): RedirectResponse
    {
        $validator = Validator::make($request->all(), [
            'fe_name' => 'required|string|max:255',
            'fe_email' => 'required|email|max:255',
            'fe_subject' => 'nullable|string|max:35',
            'fe_message' => 'required|string|min:20',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->with('error', 'Erro na valição de formulário')
                ->withErrors($validator)
                ->withInput();
        }

        try {
            $validatedData = $validator->validated();

            if (! $validatedData['fe_subject']) {
                $validatedData['fe_subject'] = 'Default Assunto';
            }

            $message = $validatedData['fe_message'];

            /** @var PendingMail $mail */
            $mail = Mail::to(config('MAIL_USERNAME'));
            $mail->replyTo($validatedData['fe_email'])
                ->send(new BewhyMailable([
                    'name' => $validatedData['fe_name'],
                    'email' => $validatedData['fe_email'],
                    'subject' => $validatedData['fe_subject'],
                    'message' => $message,
                ]));

            return redirect()->back()->with('success', 'Email enviado com sucesso!');
        } catch (Exception $exception) {
            return redirect()->back()->with('error', 'Erro ao enviar email: ' . $exception->getMessage());
        }
    }
}
